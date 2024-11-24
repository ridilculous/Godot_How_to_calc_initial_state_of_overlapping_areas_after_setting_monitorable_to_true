I’m trying to track the overlap status between two different areas. Generally it works fine, so everything seems to be setup okish, like

Body1 (enemy) has a hurt area on layer 7 and masks layer 4 with `monitorable` set to false
Body2 (tower) has a hit area on layer 4 and masks layer 7 with `monitoring` set to true

Placing them apart from each other so that the areas don’t overlap,
then setting Body1 `monitorable` to true
and finally moving them towards each other until the areas overlap triggers `area_entered` on Body2 and enables `hit_area.get_overlapping_areas()` to return a non empty array.

In special cases i want to set Body1 monitorable to true while their areas are already overlapping.
This won’t trigger `area_entered` on Body2. `hit_area.get_overlapping_areas()` will return an empty array.

They first have so be moved apart so that the areas stop overlapping and then moved towards each other so that the areas begin to overlap again to finally trigger `area_entered` on Body2 and enable `hit_area.get_overlapping_areas()` to return a non empty array.

I don't know if this behavior is expected.

[Here](https://forum.godotengine.org/t/how-to-calc-initial-state-of-overlapping-areas-after-setting-monitorable-to-true/91594/1)'s a forum thread about the issue.
