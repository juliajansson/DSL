--When is embed (eval e) == e


--Step 0: type the quantification, what is the type of e?

--eval:: Syn -> Sem
--embed:: Sem -> Syn
--e:: Syn


--Step 1: what equality is suitable for this type?

--Simplifications are not taken into account in the syntax. Same semantics can have different syntaxes. For example 3 + 7 != 10 in syntax. Thus the equality holds if e is already simplified.


--Step 2: if you use "equality up to eval" - how is the resulting property related to the first round-trip property?

--TODO: I don't understand this question
