this package is for "base"/"bare-bones" code, not actual classes

everything here is optional

maybe you need to use EntityList, or maybe a normal List or Array is enough, whatever!!
do what you want!

there's one interconnectedness / dependency:
EntityList requires that Entity provide an remove(), and maybe an update() (even if it's empty), hence the EntitySkeleton interface
...even without EntityList, i'd still want those functions, to be able to call them in a loop
