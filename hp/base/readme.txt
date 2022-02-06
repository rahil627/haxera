this package is for "base"/"bare-bones" code, not actual classes

everything here is optional

maybe you need to use EntityList, or maybe a normal List or Array is enough, whatever!!
do what you want!

there's one interconnectedness / dependency:
EntityList requires that Entity provide an remove(), and maybe an update(), hence the EntitySkeleton interface
...even without EntityList, i still want the remove() provided
