this package is for "base"/"bare-bones" code, not actual library ds'es

everything here is optional

maybe you need to use EntityList, or maybe a normal List or Array is enough, or maybe no container at all, whatever!!
do what you want!

there's one interconnectedness / dependency:
EntityList requires that Entity provide a remove(), and maybe an update() (even if it's empty), hence the EntitySkeleton interface ...even without EntityList, i'd still want those functions, to be able to call them in a loop
