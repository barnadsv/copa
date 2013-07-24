(function(Backbone, _, exports) {
	
	var tmpl = _.template([
	    '<% _.each(items, function(item) { %>',
        ' <div class="clearfix">',
        '   <label for="input-<%= item.cid %>-<%= item.label %>"><%= item.label %></label>',
        '   <div class="input">',
        '     <%= item.html %>',
        '   </div>',
        ' </div>',
        '<% }); %>'
    ].join('\n'));
  
	var rCRLF = /\r?\n/g,
    rselectTextarea = /^(?:select|textarea)/i,
    rinput = /^(?:color|date|datetime|datetime-local|email|hidden|month|number|password|range|search|tel|text|time|url|week)$/i;
		
	var Form = Backbone.Form = Backbone.View.extend({
	    
		tagName: 'form',
	    exclude: [],

	    options: {
	        template: tmpl
        },
	    
		initialize: function initialize() {
            if(!this.model) throw new Error('Backbone.Form needs a model to work with.');
            if(!(this.model instanceof Backbone.Model)) throw new Error("'Backbone.Form's model should be a Backbone.Model instance");
        },
        
		html: function html(attrs, level) {
            attrs = attrs || this.model.attributes;
            level = level ? level + '-': '';

            var self = this,
            keys = _.keys(attrs),
            items = [];

            _.each(keys, function(key, i) {
                var value = attrs[key],
                type = self.getType(value),
                exclude = !!~_.indexOf(self.exclude, key);

                if(exclude) return;

                items.push({
                    type: type,
                    html: self.getHtml(key, value, type, level),
                    label: key,
                    value: value,
                    cid: self.cid
                });
            });

            return this.options.template({
                items: items
            });
        },
	    
		getType: function getType(val) {
            if(typeof val === 'string') return 'text';
            if(typeof val === 'number') return 'text';
            if(_.isArray(val)) return 'select';
            if(typeof val === 'object') return 'object';
            if(typeof val === 'boolean') return 'checkbox';
	    },
	    
		getHtml: function getHtml(key, value, type, level) {
            var fragment,
            mapping = this.mapping || {},
            mapped = mapping[key] && this.model.get(mapping[key]);

            key = level + key;

            if(type === 'text') {
                return '<input class="xlarge" id="input-:cid-:label" name="input-:cid-:label" size="30" type="text" value=":value" />'
                    .replace(/:cid/g, this.cid)
                    .replace(/:label/g, key)
                    .replace(/:value/g, value);
            }

            if(type === 'select') {
                if(!Array.isArray(value)) throw new Error('values should be an array with select type');
                fragment = ['<select id="input-:cid-:label" name="input-:cid-:label">'];
                fragment = fragment.concat(value.map(function(val) {
                    return '<option value="' + val + '"' + (mapped && mapped === val ? 'selected="selected"': '')+ '>' + val + '</option>'
                }));
        
		        fragment.push('</select>');
                return fragment.join('\n')
                    .replace(/:cid/g, this.cid)
                    .replace(/:label/g, key)
                    .replace(/:value/g, value)
            }

            if(type === 'checkbox') {
                fragment = [
                    '<div class="input-prepend">',
                    '  <label class="add-on activ">',
                    '    <input type="checkbox" name="input-:cid-:label" id="input-:cid-:label" ' + (value ? 'checked="checked"' : '') + '/>',
                    '  </label>',
                    '</div>'
                ];

                return fragment.join('\n')
                    .replace(/:cid/g, this.cid)
                    .replace(/:label/g, key)
                    .replace(/:value/g, value);
            }
	      
		    if(type === 'object') {
                return this.html(value, key);
            }
	      
		    throw new Error('Unknown field type ' + type);
        },
	    
		render: function render() {
			$(this.el).html(this.html());
			return this;
		},
		
		serialize: function serialize(el) {
			var form = this.tagName === 'form' ? this.el : this.el.find('form'),
			self = this,
			cid = this.cid,
			o = {},
			arr;

			if(!form.length) throw new Error('Serialize must operate on a form element');

			_.each(this.serializeArray(form), function(a, i) {
				var name = a.name.replace('input-' + cid + '-', ''),
				lvls = name.split('-'),
				ln = lvls.length,
				tmp = o;

				if(ln === 1) return o[name] = self.value(a.value);

				_.each(lvls, function(lvl, i) {
					if(!tmp[lvl] && (i + 1) !== ln) tmp = tmp[lvl] = {};
					else if(tmp[lvl] && (i + 1) !== ln) tmp = tmp[lvl];
					else if(!tmp[lvl]) {
						tmp[lvl] = self.value(a.value);
					}
				});
			});

			return o;
		},
	
		serializeArray: function serializeArray(el) {
			return el.map(function(){
				return this.elements ? jQuery.makeArray( this.elements ) : this;
			}).filter(function() {
				return this.name && !this.disabled &&
			   ( this.checked != null || rselectTextarea.test( this.nodeName ) || rinput.test( this.type ) );
			}).map(function( i, elem ){
				var val = jQuery( this ).val();
				val = val === 'on' ? this.checked + '' : val;

				return val == null ? null :
				jQuery.isArray( val ) ? jQuery.map( val, function( val, i ){
				   return { name: elem.name, value: val.replace( rCRLF, "\r\n" ) };
				}) :
				{ name: elem.name, value: val.replace( rCRLF, "\r\n" ) };
			}).get();
		},
		
		value: function value(val) {
			return val === 'true' ? true :
			val === 'false' ? false :
			val === 'null' ? null :
			(!isNaN(parseFloat(val)) && isFinite(val)) ? parseFloat(val) :
			val;
		}
	});

})(this.Backbone, this._, this);

