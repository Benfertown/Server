≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡
 Recommendations
≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡

This mod without other mods applied works with the original gameconfig.xml and without any heap adjustment.
However, if you are using multiple mods it might be the case that at some point you need to adapt the gameconfig.xml and/or the heap (that is a general statement and is not specific to this mod).
If you are unsure just give it a try without changing the gameconfig.xml and the heap. In case you then experience crashes please install these add-ons as well:
• https://www.gta5-mods.com/misc/gameconfig-xml-dilapidated
• https://www.gta5-mods.com/tools/heapadjuster


≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡
 Installation via OIV
≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡

Simply extract the file "LA Trees v1.6.oiv" anywhere you want and use OpenIV -> Tools -> Package Installer to install the mod.
Selecting "mods" folder as location is recommended.


≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡
 Uninstallation via OIV
≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡

Simply extract the file "Uninstaller LA Trees.oiv" anywhere you want and use OpenIV -> Tools -> Package Installer to uninstall the mod.
Please be sure to select the same location (mods or game folder) you did on installation.


≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡
 Manual installation
≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡

• Create a new folder "la_trees" in Grand Theft Auto V\mods\update\x64\dlcpacks
• Extract the file "LA Trees v1.6.oiv" and open it with a ZIP program (like 7zip, WinZIP, WinRAR, ...)
• Extract content\dlc\dlc.rpf to Grand Theft Auto V\mods\update\x64\dlcpacks\la_trees
  (so finally there must be Grand Theft Auto V\mods\update\x64\dlcpacks\la_trees\dlc.rpf)
• Use OpenIV to edit Grand Theft Auto V\mods\update\update.rpf\common\data\dlclist.xml
• Add a new line
  <Item>dlcpacks:/la_trees/</Item>
  before line
  </Paths>


≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡
 Manual uninstallation
≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡

Revert the steps from section "Manual installation":
• Use OpenIV to edit Grand Theft Auto V\mods\update\update.rpf\common\data\dlclist.xml
• Remove any line like
  <Item>dlcpacks:/la_trees/</Item>
• Go to Grand Theft Auto V\mods\update\x64\dlcpacks and remove the folder la_trees



≡≡≡≡≡≡≡≡≡≡≡
-----------
 CHANGELOG
-----------
≡≡≡≡≡≡≡≡≡≡≡

≡≡≡≡≡≡≡≡≡≡≡≡≡
 Version 1.6
≡≡≡≡≡≡≡≡≡≡≡≡≡

Changes by Terrom:


Changes by Larcius:
• Provided OIV installation and uninstallation file.
• Slightly reworked LOD and SLOD models ("hat" for top view is more flat and is positioned depending on the prop).
• Multi-partitioned maps and major refactoring of lod and slod models (increases performance and significantly reduces required pool size of "Building").
• Adjusted brightness of some LOD and SLOD textures.
• Increased LOD distance for small props.
• Added LOD and SLOD models for prop_tree_mquite_01 and prop_rus_olive.
• Reworked textures for LOD and SLOD models of maple trees (Prop_Tree_Maple_02 and Prop_Tree_Maple_03)
• Reworked LOD models to get less noticiable transitions from LOD to HD entities (especially for palms the transition is now considerably smoother).
• Added LOD and SLOD models for ficus trees (Prop_Tree_LFicus_*).
• Recalculated distance when to change from HD to LOD model.
• Reduced/recalculated distance when to change from LOD to SLOD1 (increases performance without noticible affecting visual appearance).
• Fixed non-tree entities (like small vegetations, newspaper boxes, benches, ...) that shouldn't be static (so now they interact physically when hit by a car, on explosions, ...).


≡≡≡≡≡≡≡≡≡≡≡≡≡≡
 Version 1.5a
≡≡≡≡≡≡≡≡≡≡≡≡≡≡

Changes by Larcius:
• Fixed crashes occuring in previous version.
• Created textures and models for medium far distance view (LOD models) for vegetation entities.
• In addition to medium far distance view models (LOD models) three further far distance view models were created (SLOD1 to SLOD3 models).
• Reduced/recalculated values for far distance view models (in accordance to their size) to be more consistent with other entities.
• Performed clustering of entities to get reasonable chunks of maps (to get rid of having some ymap files with huge extents).
• Enabled reflections of vegetation (that is because for reflections LOD and SLOD1 to SLOD3 models are used).


≡≡≡≡≡≡≡≡≡≡≡≡≡
 Version 1.5
≡≡≡≡≡≡≡≡≡≡≡≡≡

Added vegetation in Westcoast area and partial part of upcoming hill forest


≡≡≡≡≡≡≡≡≡≡≡≡≡
 Version 1.4
≡≡≡≡≡≡≡≡≡≡≡≡≡

More bushes in downtown


≡≡≡≡≡≡≡≡≡≡≡≡≡
 Version 1.3
≡≡≡≡≡≡≡≡≡≡≡≡≡

Added some trees in Davis


≡≡≡≡≡≡≡≡≡≡≡≡≡
 Version 1.2
≡≡≡≡≡≡≡≡≡≡≡≡≡

Crashes fixed


≡≡≡≡≡≡≡≡≡≡≡≡≡
 Version 1.1
≡≡≡≡≡≡≡≡≡≡≡≡≡

Added over 150 trees


≡≡≡≡≡≡≡≡≡≡≡≡≡
 Version 1.0
≡≡≡≡≡≡≡≡≡≡≡≡≡

initial version
