/* Copyright (c) 2013 the authors listed at the following URL, and/or
the authors of referenced articles or incorporated external code:
http://en.literateprograms.org/Merge_sort_(JavaScript)?action=history&offset=20110810210205

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Retrieved from: http://en.literateprograms.org/Merge_sort_(JavaScript)?oldid=17233
*/


Array.prototype.swap=function(a, b)
{
	var tmp=this[a];
	this[a]=this[b];
	this[b]=tmp;
}

function insert(array, begin, end, v)
{
	while(begin+1<end && array[begin+1]<v) {
		array.swap(begin, begin+1);
		++begin;
	}
	array[begin]=v;
}

function merge_inplace(array, begin, begin_right, end)
{
	for(;begin<begin_right; ++begin) {
		if(array[begin]>array[begin_right]) {
			var v=array[begin];
			array[begin]=array[begin_right];
			insert(array, begin_right, end, v);
		}
	}
}

function msort(array, begin, end)
{
	var size=end-begin;
	if(size<2) return;

	var begin_right=begin+Math.floor(size/2);

	msort(array, begin, begin_right);
	msort(array, begin_right, end);
	merge_inplace(array, begin, begin_right, end);
}

function merge_sort_inplace(array)
{
	msort(array, 0, array.length);
}

function dosort(form)
{
	var inplace_array=form.unsorted.value.split(/ +/);

	var array=form.unsorted.value.split(/ +/);

	merge_sort_inplace(inplace_array);

	array = merge_sort(array,comparison);

	form.sorted_inplace.value=inplace_array.join(' ');

	form.sorted.value = array.join(' ');
}

function comparison(left, right)
{
	if(left == right)
		return 0;
	else if(left < right)
		return -1;
	else
		return 1;
}


