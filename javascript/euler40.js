/* 

  Euler #40 in JavaScript.

  Problem 40:
  """
  An irrational decimal fraction is created by concatenating the positive integers:
   
  0.123456789101112131415161718192021...
   
  It can be seen that the 12th digit of the fractional part is 1.

  If dn represents the nth digit of the fractional part, find the 
  value of the following expression.
  
  d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000
  """

  This JavaScript model was created by Hakan Kjellerstrand, hakank@gmail.com
  See also my JavaScript page: http://www.hakank.org/javascript_progs/

*/
'use strict';
const {timing2} = require('./js_utils.js');

// 15ms
const euler40a = function() {
    let i = 1;
    let dlen = 1;
    let p = 1;
    let index = 10; // Index = 10, 100, 1000, ..., 1000000
    while (dlen <= 1000000) {
       i++;
       const istr = i.toString();
       const istrlen = istr.length;
       if (dlen+istrlen>=index) {
          p *= parseInt(istr[index-dlen-1]);
          index *= 10;
       }
       dlen += istrlen;
    }

    return p;
}

timing2(euler40a); // 15ms

