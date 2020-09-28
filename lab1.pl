:- discontiguous
    male/1, female/1,
    parent/2, dad/2,  mom/2, kid/2, son/2, daughter/2,
    siblings/2, brother/2, sister/2,
    grandparent/2, granddad/2, grandmom/2,
    grandkid/2, grandson/2, granddaughter/2.


/* ┌────────────────────────────────────────────────┐
   │                     Rules                      │
   └────────────────────────────────────────────────┘
*/

dad(Father, Kid) :- male(Father), parent(Father, Kid).
mom(Mother, Kid) :- female(Mother), parent(Mother, Kid).
kid(Kid, Parent) :- parent(Parent, Kid).
son(Kid, Parent) :- male(Kid), kid(Kid, Parent).
daughter(Kid, Parent) :- female(Kid), kid(Kid, Parent).

brother(Bro, Kid) :- male(Bro), siblings(Bro, Kid).
sister(Sis, Kid) :- female(Sis), siblings(Sis, Kid).
siblings(Kid1, Kid2) :- dad(Father, Kid1), dad(Father, Kid2),
					   mom(Mother, Kid1), mom(Mother, Kid2),
					   Kid1 \= Kid2.

grandparent(G_parent, Kid) :- parent(G_parent, Parent), parent(Parent, Kid).
granddad(G_dad, Kid) :- male(G_dad), grandparent(G_dad, Kid).
grandmom(G_mom, Kid) :- female(G_mom), grandparent(G_mom, Kid).

grandkid(Kid, G_parent) :- grandparent(G_parent, Kid).
grandson(Kid, G_parent) :- male(Kid), grandkid(Kid, G_parent).
granddaughter(Kid, G_parent) :- female(Kid), grandkid(Kid, G_parent).

isredhood(X) :- female(X), grandmom(Y, X), eaten(Y).

/*
   ┌────────────────────────────────────────────────┐
   │                     Facts                      │
   └────────────────────────────────────────────────┘
*/


eaten('Dolbnia Galina Kirillovna').

male('Yuzefovich Kirill Arefievich').	   % My great-grandfather
female('Yuzefovich Anna Ivanovna').		   % My great-grandmother

male('Pastukhov Mikhail Ivanovich').	   % My great-grandfather
female('Pastukhova Antonina').			   % My great-grandmother

male('Dolbnia Anatoly Mikhaylovich').	   % My grandad
female('Dolbnia Galina Kirillovna').	   % My grandmom

male('Pastukhov Boris Mikhailovich').      % My grandad
female('Pastukhova Tatiana Sergeyevna').   % My grandmom

female('Dolbnia Anna Anatolyeva').		   % My Aunt
female('Dolbnia Lyudmila Nikolaevna').	   % My Aunt
female('Kostina Maria Borisovna').         % My aunt

male('Dolbnia Ales Anatolievich').		   % My dad
female('Pastukhova Irina Borisovna').      % My mom

male('Kostin Alexander Anatolyevich').     % My cousin
female('Kostina Anastasia Anatolievna').   % My cousin
male('Klimov Igor Nikolaevich').		   % My cousin
female('Klimova Galina Nikolaevna').		   % My cousin.

male('Khramtsov Ivan Vladimirovich').
female('Khramtsova Elena Vladimirovna').

male('Pastukhov Kirill Alesievich').       % Me
female('Dolbnia Anita').

parent('Yuzefovich Kirill Arefievich', 'Dolbnia Galina Kirillovna').
parent('Yuzefovich Anna Ivanovna', 'Dolbnia Galina Kirillovna').

parent('Pastukhov Mikhail Ivanovich', 'Pastukhov Boris Mikhailovich').
parent('Pastukhova Antonina', 'Pastukhov Boris Mikhailovich').

parent('Dolbnia Anatoly Mikhaylovich', 'Dolbnia Ales Anatolievich').
parent('Dolbnia Anatoly Mikhaylovich', 'Dolbnia Anna Anatolyeva').
parent('Dolbnia Anatoly Mikhaylovich', 'Dolbnia Lyudmila Nikolaevna').
parent('Dolbnia Galina Kirillovna', 'Dolbnia Ales Anatolievich').
parent('Dolbnia Galina Kirillovna', 'Dolbnia Anna Anatolyeva').
parent('Dolbnia Galina Kirillovna', 'Dolbnia Lyudmila Nikolaevna').

parent('Pastukhov Boris Mikhailovich', 'Pastukhova Irina Borisovna').
parent('Pastukhov Boris Mikhailovich', 'Kostina Maria Borisovna').
parent('Pastukhova Tatiana Sergeyevna', 'Pastukhova Irina Borisovna').
parent('Pastukhova Tatiana Sergeyevna', 'Kostina Maria Borisovna').

parent('Dolbnia Ales Anatolievich', 'Pastukhov Kirill Alesievich').
parent('Dolbnia Ales Anatolievich', 'Pastukhova Elena Alesievna').
parent('Pastukhova Irina Borisovna', 'Pastukhov Kirill Alesievich').

parent('Kostina Maria Borisovna', 'Kostin Alexander Anatolyevich').
parent('Kostina Maria Borisovna', 'Kostina Anastasia Anatolievna').

parent('Dolbnia Lyudmila Nikolaevna', 'Klimova Galina Nikolaevna').
parent('Dolbnia Lyudmila Nikolaevna', 'Klimov Igor Nikolaevich').

parent('Dolbnia Anna Anatolyeva', 'Dolbnia Anita').

parent('Klimova Galina Nikolaevna', 'Khramtsov Ivan Vladimirovich').
parent('Klimova Galina Nikolaevna', 'Khramtsova Elena Vladimirovna').
