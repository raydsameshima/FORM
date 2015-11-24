* consistency.frm

* This file for rewriting the results toward the form which Maxima can handle.


******** declarations ********
CFunction prop;
AutoDeclare Vector p;
* a = M^2 of top quark
Symbols MW, Nc, [Nc^2-1], aem, sw, Pi, a, p1dp4, p2dp3, p3dp4, p1dp3, p2dp4;

* for rewriting
Symbols mt, mw, [N^2-1];

******** end of declarations ********

* This is the output of qqttWtreelevel.frm written by Professor Ferroglia.
Local [qqttWtreelevel] =
       + prop(p3 + p4)^2*prop( - p1 + p3 + p4)^2*MW^-2*Nc^-2*[Nc^2-1]*aem*
      sw^-2*Pi * (
          + 8*p1dp4*p2dp3*p3dp4^2
          - 16*p1dp4^2*p2dp3*p3dp4
          + 8*p1dp4^3*p2dp3
          + 8*p1dp3*p2dp4*p3dp4^2
          - 16*p1dp3*p1dp4*p2dp4*p3dp4
          - 16*p1dp3*p1dp4*p2dp3*p3dp4
          + 8*p1dp3*p1dp4^2*p2dp4
          + 16*p1dp3*p1dp4^2*p2dp3
          - 16*p1dp3^2*p2dp4*p3dp4
          + 16*p1dp3^2*p1dp4*p2dp4
          + 8*p1dp3^2*p1dp4*p2dp3
          + 8*p1dp3^3*p2dp4
          + 8*a*p3dp4^3
          - 8*a*p2dp4*p3dp4^2
          - 8*a*p2dp3*p3dp4^2
          - 24*a*p1dp4*p3dp4^2
          + 16*a*p1dp4*p2dp4*p3dp4
          + 24*a*p1dp4^2*p3dp4
          - 8*a*p1dp4^2*p2dp4
          + 8*a*p1dp4^2*p2dp3
          - 8*a*p1dp4^3
          - 24*a*p1dp3*p3dp4^2
          + 16*a*p1dp3*p2dp3*p3dp4
          + 48*a*p1dp3*p1dp4*p3dp4
          - 24*a*p1dp3*p1dp4^2
          + 24*a*p1dp3^2*p3dp4
          + 8*a*p1dp3^2*p2dp4
          - 8*a*p1dp3^2*p2dp3
          - 24*a*p1dp3^2*p1dp4
          - 8*a*p1dp3^3
          - 24*a^2*p3dp4^2
          + 16*a^2*p2dp4*p3dp4
          + 16*a^2*p2dp3*p3dp4
          + 48*a^2*p1dp4*p3dp4
          - 16*a^2*p1dp4*p2dp4
          - 8*a^2*p1dp4*p2dp3
          - 24*a^2*p1dp4^2
          + 48*a^2*p1dp3*p3dp4
          - 8*a^2*p1dp3*p2dp4
          - 16*a^2*p1dp3*p2dp3
          - 48*a^2*p1dp3*p1dp4
          - 24*a^2*p1dp3^2
          + 24*a^3*p3dp4
          - 8*a^3*p2dp4
          - 8*a^3*p2dp3
          - 24*a^3*p1dp4
          - 24*a^3*p1dp3
          - 8*a^4
          )

       + prop(p3 + p4)^2*prop( - p1 + p3 + p4)^2*Nc^-2*[Nc^2-1]*aem*sw^-2*Pi
       * (
          - 8*p1dp4*p3dp4^2
          + 8*p1dp4*p2dp3*p3dp4
          + 8*p1dp4^2*p3dp4
          - 8*p1dp4^2*p2dp3
          - 8*p1dp3*p3dp4^2
          + 8*p1dp3*p2dp4*p3dp4
          + 32*p1dp3*p1dp4*p3dp4
          - 8*p1dp3*p1dp4*p2dp4
          - 8*p1dp3*p1dp4*p2dp3
          - 16*p1dp3*p1dp4^2
          + 8*p1dp3^2*p3dp4
          - 8*p1dp3^2*p2dp4
          - 16*p1dp3^2*p1dp4
          + 12*a*p3dp4^2
          - 8*a*p2dp4*p3dp4
          - 8*a*p2dp3*p3dp4
          + 8*a*p1dp4*p2dp4
          - 4*a*p1dp4^2
          + 8*a*p1dp3*p2dp3
          - 24*a*p1dp3*p1dp4
          - 4*a*p1dp3^2
          - 24*a^2*p3dp4
          + 8*a^2*p2dp4
          + 8*a^2*p2dp3
          + 8*a^2*p1dp4
          + 8*a^2*p1dp3
          + 12*a^3
          )

       + prop(p3 + p4)^2*prop( - p1 + p3 + p4)^2*MW^2*Nc^-2*[Nc^2-1]*aem*sw^-2
      *Pi * (
          - 4*p1dp4*p3dp4
          - 4*p1dp3*p3dp4
          + 8*p1dp3*p1dp4
          + 4*a*p3dp4
          + 4*a*p1dp4
          + 4*a*p1dp3
          - 4*a^2
          )

       + prop(p3 + p4)^2*prop( - p1 + p3 + p4)*prop( - p2 + p3 + p4)*MW^-2*
      Nc^-2*[Nc^2-1]*aem*sw^-2*Pi * (
          - 16*p1dp4*p2dp3*p3dp4^2
          + 16*p1dp4*p2dp3*p2dp4*p3dp4
          + 16*p1dp4*p2dp3^2*p3dp4
          + 16*p1dp4^2*p2dp3*p3dp4
          - 16*p1dp4^2*p2dp3*p2dp4
          - 16*p1dp4^2*p2dp3^2
          - 16*p1dp3*p2dp4*p3dp4^2
          + 16*p1dp3*p2dp4^2*p3dp4
          + 16*p1dp3*p2dp3*p2dp4*p3dp4
          + 16*p1dp3*p1dp4*p2dp4*p3dp4
          - 16*p1dp3*p1dp4*p2dp4^2
          + 16*p1dp3*p1dp4*p2dp3*p3dp4
          - 32*p1dp3*p1dp4*p2dp3*p2dp4
          - 16*p1dp3*p1dp4*p2dp3^2
          + 16*p1dp3^2*p2dp4*p3dp4
          - 16*p1dp3^2*p2dp4^2
          - 16*p1dp3^2*p2dp3*p2dp4
          - 16*a*p3dp4^3
          + 32*a*p2dp4*p3dp4^2
          - 16*a*p2dp4^2*p3dp4
          + 32*a*p2dp3*p3dp4^2
          - 32*a*p2dp3*p2dp4*p3dp4
          - 16*a*p2dp3^2*p3dp4
          + 32*a*p1dp4*p3dp4^2
          - 48*a*p1dp4*p2dp4*p3dp4
          + 16*a*p1dp4*p2dp4^2
          - 16*a*p1dp4*p2dp3*p3dp4
          + 16*a*p1dp4*p2dp3*p2dp4
          - 16*a*p1dp4^2*p3dp4
          + 16*a*p1dp4^2*p2dp4
          + 32*a*p1dp3*p3dp4^2
          - 16*a*p1dp3*p2dp4*p3dp4
          - 48*a*p1dp3*p2dp3*p3dp4
          + 16*a*p1dp3*p2dp3*p2dp4
          + 16*a*p1dp3*p2dp3^2
          - 32*a*p1dp3*p1dp4*p3dp4
          + 16*a*p1dp3*p1dp4*p2dp4
          + 16*a*p1dp3*p1dp4*p2dp3
          - 16*a*p1dp3^2*p3dp4
          + 16*a*p1dp3^2*p2dp3
          + 48*a^2*p3dp4^2
          - 64*a^2*p2dp4*p3dp4
          + 16*a^2*p2dp4^2
          - 64*a^2*p2dp3*p3dp4
          + 32*a^2*p2dp3*p2dp4
          + 16*a^2*p2dp3^2
          - 64*a^2*p1dp4*p3dp4
          + 48*a^2*p1dp4*p2dp4
          + 32*a^2*p1dp4*p2dp3
          + 16*a^2*p1dp4^2
          - 64*a^2*p1dp3*p3dp4
          + 32*a^2*p1dp3*p2dp4
          + 48*a^2*p1dp3*p2dp3
          + 32*a^2*p1dp3*p1dp4
          + 16*a^2*p1dp3^2
          - 48*a^3*p3dp4
          + 32*a^3*p2dp4
          + 32*a^3*p2dp3
          + 32*a^3*p1dp4
          + 32*a^3*p1dp3
          + 16*a^4
          )

       + prop(p3 + p4)^2*prop( - p1 + p3 + p4)*prop( - p2 + p3 + p4)*Nc^-2*
      [Nc^2-1]*aem*sw^-2*Pi * (
          + 8*p2dp4*p3dp4^2
          - 8*p2dp4^2*p3dp4
          + 8*p2dp3*p3dp4^2
          - 16*p2dp3*p2dp4*p3dp4
          - 8*p2dp3^2*p3dp4
          + 8*p1dp4*p3dp4^2
          - 16*p1dp4*p2dp4*p3dp4
          - 32*p1dp4*p2dp3*p3dp4
          + 24*p1dp4*p2dp3*p2dp4
          + 8*p1dp4*p2dp3^2
          - 8*p1dp4^2*p3dp4
          + 8*p1dp4^2*p2dp3
          + 8*p1dp3*p3dp4^2
          - 32*p1dp3*p2dp4*p3dp4
          + 8*p1dp3*p2dp4^2
          - 16*p1dp3*p2dp3*p3dp4
          + 24*p1dp3*p2dp3*p2dp4
          - 16*p1dp3*p1dp4*p3dp4
          + 24*p1dp3*p1dp4*p2dp4
          + 24*p1dp3*p1dp4*p2dp3
          - 8*p1dp3^2*p3dp4
          + 8*p1dp3^2*p2dp4
          - 24*a*p3dp4^2
          + 8*a*p2dp4*p3dp4
          + 8*a*p2dp4^2
          + 8*a*p2dp3*p3dp4
          + 16*a*p2dp3*p2dp4
          + 8*a*p2dp3^2
          + 8*a*p1dp4*p3dp4
          + 8*a*p1dp4*p2dp4
          + 24*a*p1dp4*p2dp3
          + 8*a*p1dp4^2
          + 8*a*p1dp3*p3dp4
          + 24*a*p1dp3*p2dp4
          + 8*a*p1dp3*p2dp3
          + 16*a*p1dp3*p1dp4
          + 8*a*p1dp3^2
          + 48*a^2*p3dp4
          - 16*a^2*p2dp4
          - 16*a^2*p2dp3
          - 16*a^2*p1dp4
          - 16*a^2*p1dp3
          - 24*a^3
          )

       + prop(p3 + p4)^2*prop( - p1 + p3 + p4)*prop( - p2 + p3 + p4)*MW^2*
      Nc^-2*[Nc^2-1]*aem*sw^-2*Pi * (
          - 8*p3dp4^2
          + 12*p2dp4*p3dp4
          + 12*p2dp3*p3dp4
          + 12*p1dp4*p3dp4
          - 8*p1dp4*p2dp3
          + 12*p1dp3*p3dp4
          - 8*p1dp3*p2dp4
          + 8*a*p3dp4
          - 12*a*p2dp4
          - 12*a*p2dp3
          - 12*a*p1dp4
          - 12*a*p1dp3
          )

       + prop(p3 + p4)^2*prop( - p1 + p3 + p4)*prop( - p2 + p3 + p4)*MW^4*
      Nc^-2*[Nc^2-1]*aem*sw^-2*Pi * (
          - 4*p3dp4
          + 4*a
          )

       + prop(p3 + p4)^2*prop( - p2 + p3 + p4)^2*MW^-2*Nc^-2*[Nc^2-1]*aem*
      sw^-2*Pi * (
          + 8*p1dp4*p2dp3*p3dp4^2
          - 16*p1dp4*p2dp3*p2dp4*p3dp4
          + 8*p1dp4*p2dp3*p2dp4^2
          - 16*p1dp4*p2dp3^2*p3dp4
          + 16*p1dp4*p2dp3^2*p2dp4
          + 8*p1dp4*p2dp3^3
          + 8*p1dp3*p2dp4*p3dp4^2
          - 16*p1dp3*p2dp4^2*p3dp4
          + 8*p1dp3*p2dp4^3
          - 16*p1dp3*p2dp3*p2dp4*p3dp4
          + 16*p1dp3*p2dp3*p2dp4^2
          + 8*p1dp3*p2dp3^2*p2dp4
          + 8*a*p3dp4^3
          - 24*a*p2dp4*p3dp4^2
          + 24*a*p2dp4^2*p3dp4
          - 8*a*p2dp4^3
          - 24*a*p2dp3*p3dp4^2
          + 48*a*p2dp3*p2dp4*p3dp4
          - 24*a*p2dp3*p2dp4^2
          + 24*a*p2dp3^2*p3dp4
          - 24*a*p2dp3^2*p2dp4
          - 8*a*p2dp3^3
          - 8*a*p1dp4*p3dp4^2
          + 16*a*p1dp4*p2dp4*p3dp4
          - 8*a*p1dp4*p2dp4^2
          + 8*a*p1dp4*p2dp3^2
          - 8*a*p1dp3*p3dp4^2
          + 8*a*p1dp3*p2dp4^2
          + 16*a*p1dp3*p2dp3*p3dp4
          - 8*a*p1dp3*p2dp3^2
          - 24*a^2*p3dp4^2
          + 48*a^2*p2dp4*p3dp4
          - 24*a^2*p2dp4^2
          + 48*a^2*p2dp3*p3dp4
          - 48*a^2*p2dp3*p2dp4
          - 24*a^2*p2dp3^2
          + 16*a^2*p1dp4*p3dp4
          - 16*a^2*p1dp4*p2dp4
          - 8*a^2*p1dp4*p2dp3
          + 16*a^2*p1dp3*p3dp4
          - 8*a^2*p1dp3*p2dp4
          - 16*a^2*p1dp3*p2dp3
          + 24*a^3*p3dp4
          - 24*a^3*p2dp4
          - 24*a^3*p2dp3
          - 8*a^3*p1dp4
          - 8*a^3*p1dp3
          - 8*a^4
          )

       + prop(p3 + p4)^2*prop( - p2 + p3 + p4)^2*Nc^-2*[Nc^2-1]*aem*sw^-2*Pi
       * (
          - 8*p2dp4*p3dp4^2
          + 8*p2dp4^2*p3dp4
          - 8*p2dp3*p3dp4^2
          + 32*p2dp3*p2dp4*p3dp4
          - 16*p2dp3*p2dp4^2
          + 8*p2dp3^2*p3dp4
          - 16*p2dp3^2*p2dp4
          + 8*p1dp4*p2dp3*p3dp4
          - 8*p1dp4*p2dp3*p2dp4
          - 8*p1dp4*p2dp3^2
          + 8*p1dp3*p2dp4*p3dp4
          - 8*p1dp3*p2dp4^2
          - 8*p1dp3*p2dp3*p2dp4
          + 12*a*p3dp4^2
          - 4*a*p2dp4^2
          - 24*a*p2dp3*p2dp4
          - 4*a*p2dp3^2
          - 8*a*p1dp4*p3dp4
          + 8*a*p1dp4*p2dp4
          - 8*a*p1dp3*p3dp4
          + 8*a*p1dp3*p2dp3
          - 24*a^2*p3dp4
          + 8*a^2*p2dp4
          + 8*a^2*p2dp3
          + 8*a^2*p1dp4
          + 8*a^2*p1dp3
          + 12*a^3
          )

       + prop(p3 + p4)^2*prop( - p2 + p3 + p4)^2*MW^2*Nc^-2*[Nc^2-1]*aem*sw^-2
      *Pi * (
          - 4*p2dp4*p3dp4
          - 4*p2dp3*p3dp4
          + 8*p2dp3*p2dp4
          + 4*a*p3dp4
          + 4*a*p2dp4
          + 4*a*p2dp3
          - 4*a^2
          );
Local [qqttWtreelevel0] =
prop(p3 + p4)^2*prop( - p1 + p3 + p4)^2*MW^-2*Nc^-2*[Nc^2-1]*aem*
      sw^-2*Pi * (
          + 8*p1dp4*p2dp3*p3dp4^2
          - 16*p1dp4^2*p2dp3*p3dp4
          + 8*p1dp4^3*p2dp3
          + 8*p1dp3*p2dp4*p3dp4^2
          - 16*p1dp3*p1dp4*p2dp4*p3dp4
          - 16*p1dp3*p1dp4*p2dp3*p3dp4
          + 8*p1dp3*p1dp4^2*p2dp4
          + 16*p1dp3*p1dp4^2*p2dp3
          - 16*p1dp3^2*p2dp4*p3dp4
          + 16*p1dp3^2*p1dp4*p2dp4
          + 8*p1dp3^2*p1dp4*p2dp3
          + 8*p1dp3^3*p2dp4
          + 8*a*p3dp4^3
          - 8*a*p2dp4*p3dp4^2
          - 8*a*p2dp3*p3dp4^2
          - 24*a*p1dp4*p3dp4^2
          + 16*a*p1dp4*p2dp4*p3dp4
          + 24*a*p1dp4^2*p3dp4
          - 8*a*p1dp4^2*p2dp4
          + 8*a*p1dp4^2*p2dp3
          - 8*a*p1dp4^3
          - 24*a*p1dp3*p3dp4^2
          + 16*a*p1dp3*p2dp3*p3dp4
          + 48*a*p1dp3*p1dp4*p3dp4
          - 24*a*p1dp3*p1dp4^2
          + 24*a*p1dp3^2*p3dp4
          + 8*a*p1dp3^2*p2dp4
          - 8*a*p1dp3^2*p2dp3
          - 24*a*p1dp3^2*p1dp4
          - 8*a*p1dp3^3
          - 24*a^2*p3dp4^2
          + 16*a^2*p2dp4*p3dp4
          + 16*a^2*p2dp3*p3dp4
          + 48*a^2*p1dp4*p3dp4
          - 16*a^2*p1dp4*p2dp4
          - 8*a^2*p1dp4*p2dp3
          - 24*a^2*p1dp4^2
          + 48*a^2*p1dp3*p3dp4
          - 8*a^2*p1dp3*p2dp4
          - 16*a^2*p1dp3*p2dp3
          - 48*a^2*p1dp3*p1dp4
          - 24*a^2*p1dp3^2
          + 24*a^3*p3dp4
          - 8*a^3*p2dp4
          - 8*a^3*p2dp3
          - 24*a^3*p1dp4
          - 24*a^3*p1dp3
          - 8*a^4
          )

       + prop(p3 + p4)^2*prop( - p1 + p3 + p4)^2*Nc^-2*[Nc^2-1]*aem*sw^-2*Pi
       * (
          + 4*a*p3dp4^2
          - 8*a*p1dp4*p3dp4
          + 4*a*p1dp4^2
          - 8*a*p1dp3*p3dp4
          + 8*a*p1dp3*p1dp4
          + 4*a*p1dp3^2
          - 8*a^2*p3dp4
          + 8*a^2*p1dp4
          + 8*a^2*p1dp3
          + 4*a^3
          )

       + prop(p3 + p4)^2*prop( - p1 + p3 + p4)*prop( - p2 + p3 + p4)*MW^-2*
      Nc^-2*[Nc^2-1]*aem*sw^-2*Pi * (
          - 16*p1dp4*p2dp3*p3dp4^2
          + 16*p1dp4*p2dp3*p2dp4*p3dp4
          + 16*p1dp4*p2dp3^2*p3dp4
          + 16*p1dp4^2*p2dp3*p3dp4
          - 16*p1dp4^2*p2dp3*p2dp4
          - 16*p1dp4^2*p2dp3^2
          - 16*p1dp3*p2dp4*p3dp4^2
          + 16*p1dp3*p2dp4^2*p3dp4
          + 16*p1dp3*p2dp3*p2dp4*p3dp4
          + 16*p1dp3*p1dp4*p2dp4*p3dp4
          - 16*p1dp3*p1dp4*p2dp4^2
          + 16*p1dp3*p1dp4*p2dp3*p3dp4
          - 32*p1dp3*p1dp4*p2dp3*p2dp4
          - 16*p1dp3*p1dp4*p2dp3^2
          + 16*p1dp3^2*p2dp4*p3dp4
          - 16*p1dp3^2*p2dp4^2
          - 16*p1dp3^2*p2dp3*p2dp4
          - 16*a*p3dp4^3
          + 32*a*p2dp4*p3dp4^2
          - 16*a*p2dp4^2*p3dp4
          + 32*a*p2dp3*p3dp4^2
          - 32*a*p2dp3*p2dp4*p3dp4
          - 16*a*p2dp3^2*p3dp4
          + 32*a*p1dp4*p3dp4^2
          - 48*a*p1dp4*p2dp4*p3dp4
          + 16*a*p1dp4*p2dp4^2
          - 16*a*p1dp4*p2dp3*p3dp4
          + 16*a*p1dp4*p2dp3*p2dp4
          - 16*a*p1dp4^2*p3dp4
          + 16*a*p1dp4^2*p2dp4
          + 32*a*p1dp3*p3dp4^2
          - 16*a*p1dp3*p2dp4*p3dp4
          - 48*a*p1dp3*p2dp3*p3dp4
          + 16*a*p1dp3*p2dp3*p2dp4
          + 16*a*p1dp3*p2dp3^2
          - 32*a*p1dp3*p1dp4*p3dp4
          + 16*a*p1dp3*p1dp4*p2dp4
          + 16*a*p1dp3*p1dp4*p2dp3
          - 16*a*p1dp3^2*p3dp4
          + 16*a*p1dp3^2*p2dp3
          + 48*a^2*p3dp4^2
          - 64*a^2*p2dp4*p3dp4
          + 16*a^2*p2dp4^2
          - 64*a^2*p2dp3*p3dp4
          + 32*a^2*p2dp3*p2dp4
          + 16*a^2*p2dp3^2
          - 64*a^2*p1dp4*p3dp4
          + 48*a^2*p1dp4*p2dp4
          + 32*a^2*p1dp4*p2dp3
          + 16*a^2*p1dp4^2
          - 64*a^2*p1dp3*p3dp4
          + 32*a^2*p1dp3*p2dp4
          + 48*a^2*p1dp3*p2dp3
          + 32*a^2*p1dp3*p1dp4
          + 16*a^2*p1dp3^2
          - 48*a^3*p3dp4
          + 32*a^3*p2dp4
          + 32*a^3*p2dp3
          + 32*a^3*p1dp4
          + 32*a^3*p1dp3
          + 16*a^4
          )

       + prop(p3 + p4)^2*prop( - p1 + p3 + p4)*prop( - p2 + p3 + p4)*Nc^-2*
      [Nc^2-1]*aem*sw^-2*Pi * (
          - 8*a*p3dp4^2
          + 8*a*p2dp4*p3dp4
          + 8*a*p2dp3*p3dp4
          + 8*a*p1dp4*p3dp4
          - 8*a*p1dp4*p2dp4
          - 8*a*p1dp4*p2dp3
          + 8*a*p1dp3*p3dp4
          - 8*a*p1dp3*p2dp4
          - 8*a*p1dp3*p2dp3
          + 16*a^2*p3dp4
          - 8*a^2*p2dp4
          - 8*a^2*p2dp3
          - 8*a^2*p1dp4
          - 8*a^2*p1dp3
          - 8*a^3
          )

       + prop(p3 + p4)^2*prop( - p2 + p3 + p4)^2*MW^-2*Nc^-2*[Nc^2-1]*aem*
      sw^-2*Pi * (
          + 8*p1dp4*p2dp3*p3dp4^2
          - 16*p1dp4*p2dp3*p2dp4*p3dp4
          + 8*p1dp4*p2dp3*p2dp4^2
          - 16*p1dp4*p2dp3^2*p3dp4
          + 16*p1dp4*p2dp3^2*p2dp4
          + 8*p1dp4*p2dp3^3
          + 8*p1dp3*p2dp4*p3dp4^2
          - 16*p1dp3*p2dp4^2*p3dp4
          + 8*p1dp3*p2dp4^3
          - 16*p1dp3*p2dp3*p2dp4*p3dp4
          + 16*p1dp3*p2dp3*p2dp4^2
          + 8*p1dp3*p2dp3^2*p2dp4
          + 8*a*p3dp4^3
          - 24*a*p2dp4*p3dp4^2
          + 24*a*p2dp4^2*p3dp4
          - 8*a*p2dp4^3
          - 24*a*p2dp3*p3dp4^2
          + 48*a*p2dp3*p2dp4*p3dp4
          - 24*a*p2dp3*p2dp4^2
          + 24*a*p2dp3^2*p3dp4
          - 24*a*p2dp3^2*p2dp4
          - 8*a*p2dp3^3
          - 8*a*p1dp4*p3dp4^2
          + 16*a*p1dp4*p2dp4*p3dp4
          - 8*a*p1dp4*p2dp4^2
          + 8*a*p1dp4*p2dp3^2
          - 8*a*p1dp3*p3dp4^2
          + 8*a*p1dp3*p2dp4^2
          + 16*a*p1dp3*p2dp3*p3dp4
          - 8*a*p1dp3*p2dp3^2
          - 24*a^2*p3dp4^2
          + 48*a^2*p2dp4*p3dp4
          - 24*a^2*p2dp4^2
          + 48*a^2*p2dp3*p3dp4
          - 48*a^2*p2dp3*p2dp4
          - 24*a^2*p2dp3^2
          + 16*a^2*p1dp4*p3dp4
          - 16*a^2*p1dp4*p2dp4
          - 8*a^2*p1dp4*p2dp3
          + 16*a^2*p1dp3*p3dp4
          - 8*a^2*p1dp3*p2dp4
          - 16*a^2*p1dp3*p2dp3
          + 24*a^3*p3dp4
          - 24*a^3*p2dp4
          - 24*a^3*p2dp3
          - 8*a^3*p1dp4
          - 8*a^3*p1dp3
          - 8*a^4
          )

       + prop(p3 + p4)^2*prop( - p2 + p3 + p4)^2*Nc^-2*[Nc^2-1]*aem*sw^-2*Pi
       * (
          + 4*a*p3dp4^2
          - 8*a*p2dp4*p3dp4
          + 4*a*p2dp4^2
          - 8*a*p2dp3*p3dp4
          + 8*a*p2dp3*p2dp4
          + 4*a*p2dp3^2
          - 8*a^2*p3dp4
          + 8*a^2*p2dp4
          + 8*a^2*p2dp3
          + 4*a^3
          );

* for my normalization
id Pi = 1;
id aem = 1;
id Nc^-1 = 1;
id sw^-1 = 1;
.sort

Function eta;

* He used metric (-+++)
id p1dp4 = -eta(p1,p4);
id p2dp3 = -eta(p2,p3); 
id p3dp4 = -eta(p3,p4); 
id p1dp3 = -eta(p1,p3); 
id p2dp4 = -eta(p2,p4);

id a = -mt^2;
id MW = mw;
id MW^-1 = mw^-1;

id [Nc^2-1] = [N^2-1];

Bracket prop, [N^2-1];
* Bracket prop(2*mt^2 + 2*p3.p4) [];
print +s;
.sort

* for my prop
Vector q;
id prop(q?) = prop(q.q);

argument;
  id p3.p3 = mt^2;
  id p4.p4 = mt^2;
endargument;

Bracket prop, [N^2-1];
print +s;
* .end
.sort

*for debugging
* Bracket eta, prop, [N^2-1];
* print +s;
* .end

* my result
Local M =
       + prop(2*mt^2 + 2*p3.p4)^2*prop(2*mw^2 - 2*p2.p3 - 2*p2.p4 + 2*p3.p4)^2
      *[N^2-1]*mw^-2 * (
          - 16*p2.p1*p2.p3*p2.p4*mt^2
          + 16*p2.p1*p2.p3*p3.p4*mt^2
          - 8*p2.p1*p2.p3^2*mt^2
          + 16*p2.p1*p2.p4*p3.p4*mt^2
          - 8*p2.p1*p2.p4^2*mt^2
          - 8*p2.p1*p3.p4^2*mt^2
          + 16*p2.p3*p2.p4*p1.p3*p3.p4
          + 16*p2.p3*p2.p4*p1.p4*p3.p4
          - 16*p2.p3*p2.p4^2*p1.p3
          - 8*p2.p3*p2.p4^2*p1.p4
          - 8*p2.p3*p1.p4*p3.p4^2
          - 8*p2.p3^2*p2.p4*p1.p3
          - 16*p2.p3^2*p2.p4*p1.p4
          + 16*p2.p3^2*p1.p4*p3.p4
          - 8*p2.p3^3*p1.p4
          - 8*p2.p4*p1.p3*p3.p4^2
          + 16*p2.p4^2*p1.p3*p3.p4
          - 8*p2.p4^3*p1.p3
          )

       + prop(2*mt^2 + 2*p3.p4)^2*prop(2*mw^2 - 2*p2.p3 - 2*p2.p4 + 2*p3.p4)^2
      *[N^2-1] * (
          - 16*p2.p1*p2.p3*p2.p4
          + 8*p2.p1*p2.p3*p3.p4
          + 16*p2.p1*p2.p3*mt^2
          + 8*p2.p1*p2.p4*p3.p4
          + 16*p2.p1*p2.p4*mt^2
          - 8*p2.p1*p3.p4*mt^2
          + 24*p2.p3*p2.p4*p1.p3
          + 24*p2.p3*p2.p4*p1.p4
          - 8*p2.p3*p1.p3*p3.p4
          - 8*p2.p3*p1.p3*mt^2
          - 16*p2.p3*p1.p4*p3.p4
          - 8*p2.p3*p1.p4*mt^2
          + 8*p2.p3^2*p1.p4
          - 16*p2.p4*p1.p3*p3.p4
          - 8*p2.p4*p1.p3*mt^2
          - 8*p2.p4*p1.p4*p3.p4
          - 8*p2.p4*p1.p4*mt^2
          + 8*p2.p4^2*p1.p3
          )

       + prop(2*mt^2 + 2*p3.p4)^2*prop(2*mw^2 - 2*p2.p3 - 2*p2.p4 + 2*p3.p4)^2
      *[N^2-1]*mw^2 * (
          + 8*p2.p1*p2.p3
          + 8*p2.p1*p2.p4
          - 8*p2.p3*p1.p3
          - 8*p2.p3*p1.p4
          - 8*p2.p4*p1.p3
          - 8*p2.p4*p1.p4
          )

       + prop(2*mt^2 + 2*p3.p4)^2*prop(2*mw^2 - 2*p2.p3 - 2*p2.p4 + 2*p3.p4)*
      prop(2*mw^2 - 2*p1.p3 - 2*p1.p4 + 2*p3.p4)*[N^2-1]*mw^-2 * (
          + 16*p2.p1*p2.p3*p1.p3*mt^2
          + 16*p2.p1*p2.p3*p1.p4*mt^2
          - 16*p2.p1*p2.p3*p3.p4*mt^2
          + 16*p2.p1*p2.p4*p1.p3*mt^2
          + 16*p2.p1*p2.p4*p1.p4*mt^2
          - 16*p2.p1*p2.p4*p3.p4*mt^2
          - 16*p2.p1*p1.p3*p3.p4*mt^2
          - 16*p2.p1*p1.p4*p3.p4*mt^2
          + 16*p2.p1*p3.p4^2*mt^2
          + 32*p2.p3*p2.p4*p1.p3*p1.p4
          - 16*p2.p3*p2.p4*p1.p3*p3.p4
          + 16*p2.p3*p2.p4*p1.p3^2
          - 16*p2.p3*p2.p4*p1.p4*p3.p4
          + 16*p2.p3*p2.p4*p1.p4^2
          - 16*p2.p3*p1.p3*p1.p4*p3.p4
          + 16*p2.p3*p1.p4*p3.p4^2
          - 16*p2.p3*p1.p4^2*p3.p4
          + 16*p2.p3^2*p1.p3*p1.p4
          - 16*p2.p3^2*p1.p4*p3.p4
          + 16*p2.p3^2*p1.p4^2
          - 16*p2.p4*p1.p3*p1.p4*p3.p4
          + 16*p2.p4*p1.p3*p3.p4^2
          - 16*p2.p4*p1.p3^2*p3.p4
          + 16*p2.p4^2*p1.p3*p1.p4
          - 16*p2.p4^2*p1.p3*p3.p4
          + 16*p2.p4^2*p1.p3^2
          )

       + prop(2*mt^2 + 2*p3.p4)^2*prop(2*mw^2 - 2*p2.p3 - 2*p2.p4 + 2*p3.p4)*
      prop(2*mw^2 - 2*p1.p3 - 2*p1.p4 + 2*p3.p4)*[N^2-1] * (
          + 16*p2.p1*p2.p3*p1.p4
          + 8*p2.p1*p2.p3*p3.p4
          + 16*p2.p1*p2.p4*p1.p3
          + 8*p2.p1*p2.p4*p3.p4
          + 8*p2.p1*p1.p3*p3.p4
          + 8*p2.p1*p1.p4*p3.p4
          - 16*p2.p1*p3.p4^2
          - 16*p2.p1^2*p3.p4
          - 16*p2.p1^2*mt^2
          - 8*p2.p3*p2.p4*p1.p3
          - 8*p2.p3*p2.p4*p1.p4
          - 8*p2.p3*p1.p3*p1.p4
          + 32*p2.p3*p1.p4*p3.p4
          - 24*p2.p3*p1.p4^2
          - 24*p2.p3^2*p1.p4
          - 8*p2.p4*p1.p3*p1.p4
          + 32*p2.p4*p1.p3*p3.p4
          - 24*p2.p4*p1.p3^2
          - 24*p2.p4^2*p1.p3
          )

       + prop(2*mt^2 + 2*p3.p4)^2*prop(2*mw^2 - 2*p2.p3 - 2*p2.p4 + 2*p3.p4)*
      prop(2*mw^2 - 2*p1.p3 - 2*p1.p4 + 2*p3.p4)*[N^2-1]*mw^2 * (
          - 8*p2.p1*p2.p3
          - 8*p2.p1*p2.p4
          - 8*p2.p1*p1.p3
          - 8*p2.p1*p1.p4
          - 16*p2.p1*p3.p4
          - 16*p2.p1*mt^2
          + 16*p2.p3*p1.p4
          + 16*p2.p4*p1.p3
          )

       + prop(2*mt^2 + 2*p3.p4)^2*prop(2*mw^2 - 2*p1.p3 - 2*p1.p4 + 2*p3.p4)^2
      *[N^2-1]*mw^-2 * (
          - 16*p2.p1*p1.p3*p1.p4*mt^2
          + 16*p2.p1*p1.p3*p3.p4*mt^2
          - 8*p2.p1*p1.p3^2*mt^2
          + 16*p2.p1*p1.p4*p3.p4*mt^2
          - 8*p2.p1*p1.p4^2*mt^2
          - 8*p2.p1*p3.p4^2*mt^2
          + 16*p2.p3*p1.p3*p1.p4*p3.p4
          - 16*p2.p3*p1.p3*p1.p4^2
          - 8*p2.p3*p1.p3^2*p1.p4
          - 8*p2.p3*p1.p4*p3.p4^2
          + 16*p2.p3*p1.p4^2*p3.p4
          - 8*p2.p3*p1.p4^3
          + 16*p2.p4*p1.p3*p1.p4*p3.p4
          - 8*p2.p4*p1.p3*p1.p4^2
          - 8*p2.p4*p1.p3*p3.p4^2
          - 16*p2.p4*p1.p3^2*p1.p4
          + 16*p2.p4*p1.p3^2*p3.p4
          - 8*p2.p4*p1.p3^3
          )

       + prop(2*mt^2 + 2*p3.p4)^2*prop(2*mw^2 - 2*p1.p3 - 2*p1.p4 + 2*p3.p4)^2
      *[N^2-1] * (
          - 16*p2.p1*p1.p3*p1.p4
          + 8*p2.p1*p1.p3*p3.p4
          + 16*p2.p1*p1.p3*mt^2
          + 8*p2.p1*p1.p4*p3.p4
          + 16*p2.p1*p1.p4*mt^2
          - 8*p2.p1*p3.p4*mt^2
          + 24*p2.p3*p1.p3*p1.p4
          - 8*p2.p3*p1.p3*p3.p4
          - 8*p2.p3*p1.p3*mt^2
          - 16*p2.p3*p1.p4*p3.p4
          - 8*p2.p3*p1.p4*mt^2
          + 8*p2.p3*p1.p4^2
          + 24*p2.p4*p1.p3*p1.p4
          - 16*p2.p4*p1.p3*p3.p4
          - 8*p2.p4*p1.p3*mt^2
          + 8*p2.p4*p1.p3^2
          - 8*p2.p4*p1.p4*p3.p4
          - 8*p2.p4*p1.p4*mt^2
          )

       + prop(2*mt^2 + 2*p3.p4)^2*prop(2*mw^2 - 2*p1.p3 - 2*p1.p4 + 2*p3.p4)^2
      *[N^2-1]*mw^2 * (
          + 8*p2.p1*p1.p3
          + 8*p2.p1*p1.p4
          - 8*p2.p3*p1.p3
          - 8*p2.p3*p1.p4
          - 8*p2.p4*p1.p3
          - 8*p2.p4*p1.p4
          );

Local MM =
+ prop(2*mt^2 + 2*p3.p4)^2*prop(2*mt^2 - 2*p2.p3 - 2*p2.p4 + 2*p3.p4)^2
      *mw^-2 * (
          - 16*p2.p1*p2.p3*p2.p4*[N^2-1]*mt^2
          + 16*p2.p1*p2.p3*p3.p4*[N^2-1]*mt^2
          + 16*p2.p1*p2.p3*[N^2-1]*mt^4
          - 8*p2.p1*p2.p3^2*[N^2-1]*mt^2
          + 16*p2.p1*p2.p4*p3.p4*[N^2-1]*mt^2
          + 16*p2.p1*p2.p4*[N^2-1]*mt^4
          - 8*p2.p1*p2.p4^2*[N^2-1]*mt^2
          - 16*p2.p1*p3.p4*[N^2-1]*mt^4
          - 8*p2.p1*p3.p4^2*[N^2-1]*mt^2
          - 8*p2.p1*[N^2-1]*mt^6
          + 16*p2.p3*p2.p4*p1.p3*p3.p4*[N^2-1]
          + 16*p2.p3*p2.p4*p1.p3*[N^2-1]*mt^2
          + 16*p2.p3*p2.p4*p1.p4*p3.p4*[N^2-1]
          + 16*p2.p3*p2.p4*p1.p4*[N^2-1]*mt^2
          - 16*p2.p3*p2.p4^2*p1.p3*[N^2-1]
          - 8*p2.p3*p2.p4^2*p1.p4*[N^2-1]
          - 16*p2.p3*p1.p4*p3.p4*[N^2-1]*mt^2
          - 8*p2.p3*p1.p4*p3.p4^2*[N^2-1]
          - 8*p2.p3*p1.p4*[N^2-1]*mt^4
          - 8*p2.p3^2*p2.p4*p1.p3*[N^2-1]
          - 16*p2.p3^2*p2.p4*p1.p4*[N^2-1]
          + 16*p2.p3^2*p1.p4*p3.p4*[N^2-1]
          + 16*p2.p3^2*p1.p4*[N^2-1]*mt^2
          - 8*p2.p3^3*p1.p4*[N^2-1]
          - 16*p2.p4*p1.p3*p3.p4*[N^2-1]*mt^2
          - 8*p2.p4*p1.p3*p3.p4^2*[N^2-1]
          - 8*p2.p4*p1.p3*[N^2-1]*mt^4
          + 16*p2.p4^2*p1.p3*p3.p4*[N^2-1]
          + 16*p2.p4^2*p1.p3*[N^2-1]*mt^2
          - 8*p2.p4^3*p1.p3*[N^2-1]
          )

       + prop(2*mt^2 + 2*p3.p4)^2*prop(2*mt^2 - 2*p2.p3 - 2*p2.p4 + 2*p3.p4)*
      prop(2*mt^2 - 2*p1.p3 - 2*p1.p4 + 2*p3.p4)*mw^-2 * (
          + 16*p2.p1*p2.p3*p1.p3*[N^2-1]*mt^2
          + 16*p2.p1*p2.p3*p1.p4*[N^2-1]*mt^2
          - 16*p2.p1*p2.p3*p3.p4*[N^2-1]*mt^2
          - 16*p2.p1*p2.p3*[N^2-1]*mt^4
          + 16*p2.p1*p2.p4*p1.p3*[N^2-1]*mt^2
          + 16*p2.p1*p2.p4*p1.p4*[N^2-1]*mt^2
          - 16*p2.p1*p2.p4*p3.p4*[N^2-1]*mt^2
          - 16*p2.p1*p2.p4*[N^2-1]*mt^4
          - 16*p2.p1*p1.p3*p3.p4*[N^2-1]*mt^2
          - 16*p2.p1*p1.p3*[N^2-1]*mt^4
          - 16*p2.p1*p1.p4*p3.p4*[N^2-1]*mt^2
          - 16*p2.p1*p1.p4*[N^2-1]*mt^4
          + 32*p2.p1*p3.p4*[N^2-1]*mt^4
          + 16*p2.p1*p3.p4^2*[N^2-1]*mt^2
          + 16*p2.p1*[N^2-1]*mt^6
          + 32*p2.p3*p2.p4*p1.p3*p1.p4*[N^2-1]
          - 16*p2.p3*p2.p4*p1.p3*p3.p4*[N^2-1]
          - 16*p2.p3*p2.p4*p1.p3*[N^2-1]*mt^2
          + 16*p2.p3*p2.p4*p1.p3^2*[N^2-1]
          - 16*p2.p3*p2.p4*p1.p4*p3.p4*[N^2-1]
          - 16*p2.p3*p2.p4*p1.p4*[N^2-1]*mt^2
          + 16*p2.p3*p2.p4*p1.p4^2*[N^2-1]
          - 16*p2.p3*p1.p3*p1.p4*p3.p4*[N^2-1]
          - 16*p2.p3*p1.p3*p1.p4*[N^2-1]*mt^2
          + 32*p2.p3*p1.p4*p3.p4*[N^2-1]*mt^2
          + 16*p2.p3*p1.p4*p3.p4^2*[N^2-1]
          + 16*p2.p3*p1.p4*[N^2-1]*mt^4
          - 16*p2.p3*p1.p4^2*p3.p4*[N^2-1]
          - 16*p2.p3*p1.p4^2*[N^2-1]*mt^2
          + 16*p2.p3^2*p1.p3*p1.p4*[N^2-1]
          - 16*p2.p3^2*p1.p4*p3.p4*[N^2-1]
          - 16*p2.p3^2*p1.p4*[N^2-1]*mt^2
          + 16*p2.p3^2*p1.p4^2*[N^2-1]
          - 16*p2.p4*p1.p3*p1.p4*p3.p4*[N^2-1]
          - 16*p2.p4*p1.p3*p1.p4*[N^2-1]*mt^2
          + 32*p2.p4*p1.p3*p3.p4*[N^2-1]*mt^2
          + 16*p2.p4*p1.p3*p3.p4^2*[N^2-1]
          + 16*p2.p4*p1.p3*[N^2-1]*mt^4
          - 16*p2.p4*p1.p3^2*p3.p4*[N^2-1]
          - 16*p2.p4*p1.p3^2*[N^2-1]*mt^2
          + 16*p2.p4^2*p1.p3*p1.p4*[N^2-1]
          - 16*p2.p4^2*p1.p3*p3.p4*[N^2-1]
          - 16*p2.p4^2*p1.p3*[N^2-1]*mt^2
          + 16*p2.p4^2*p1.p3^2*[N^2-1]
          )

       + prop(2*mt^2 + 2*p3.p4)^2*prop(2*mt^2 - 2*p1.p3 - 2*p1.p4 + 2*p3.p4)^2
      *mw^-2 * (
          - 16*p2.p1*p1.p3*p1.p4*[N^2-1]*mt^2
          + 16*p2.p1*p1.p3*p3.p4*[N^2-1]*mt^2
          + 16*p2.p1*p1.p3*[N^2-1]*mt^4
          - 8*p2.p1*p1.p3^2*[N^2-1]*mt^2
          + 16*p2.p1*p1.p4*p3.p4*[N^2-1]*mt^2
          + 16*p2.p1*p1.p4*[N^2-1]*mt^4
          - 8*p2.p1*p1.p4^2*[N^2-1]*mt^2
          - 16*p2.p1*p3.p4*[N^2-1]*mt^4
          - 8*p2.p1*p3.p4^2*[N^2-1]*mt^2
          - 8*p2.p1*[N^2-1]*mt^6
          + 16*p2.p3*p1.p3*p1.p4*p3.p4*[N^2-1]
          + 16*p2.p3*p1.p3*p1.p4*[N^2-1]*mt^2
          - 16*p2.p3*p1.p3*p1.p4^2*[N^2-1]
          - 8*p2.p3*p1.p3^2*p1.p4*[N^2-1]
          - 16*p2.p3*p1.p4*p3.p4*[N^2-1]*mt^2
          - 8*p2.p3*p1.p4*p3.p4^2*[N^2-1]
          - 8*p2.p3*p1.p4*[N^2-1]*mt^4
          + 16*p2.p3*p1.p4^2*p3.p4*[N^2-1]
          + 16*p2.p3*p1.p4^2*[N^2-1]*mt^2
          - 8*p2.p3*p1.p4^3*[N^2-1]
          + 16*p2.p4*p1.p3*p1.p4*p3.p4*[N^2-1]
          + 16*p2.p4*p1.p3*p1.p4*[N^2-1]*mt^2
          - 8*p2.p4*p1.p3*p1.p4^2*[N^2-1]
          - 16*p2.p4*p1.p3*p3.p4*[N^2-1]*mt^2
          - 8*p2.p4*p1.p3*p3.p4^2*[N^2-1]
          - 8*p2.p4*p1.p3*[N^2-1]*mt^4
          - 16*p2.p4*p1.p3^2*p1.p4*[N^2-1]
          + 16*p2.p4*p1.p3^2*p3.p4*[N^2-1]
          + 16*p2.p4*p1.p3^2*[N^2-1]*mt^2
          - 8*p2.p4*p1.p3^3*[N^2-1]
          );
id p1?.p2? = eta(p1,p2);
argument;
  id p1?.p2? = eta(p1,p2);
endargument;
*for debugging
* Bracket eta, prop, [N^2-1];
* print +s;
* .end

Bracket prop, [N^2-1];
Print +s;
.end
.sort

Local diff = [qqttWtreelevel] - M;

Bracket prop, [N^2-1];
Print +s;
.end
