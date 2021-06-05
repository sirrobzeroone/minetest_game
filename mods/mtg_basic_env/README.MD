## Read Me

mtg_basic_env is a library/archive of the environment nodes that were available under the "default" mod. This includes  that were registered as a table under the "default" global table and individual sounds that were accessed directly under the sounds folder examples:

### Sounds table access
     sounds = default.node_sound_leaves_defaults(),
     
### Individual sounds
     sounds = "default_item_smoke", or
     sound = {breaks = "default_tool_breaks"}
	 
Sound tables have been re-pointed so default.node_sound_leaves_defaults() points to mtg_basic_sounds.node_sound_leaves(). Sound names have also been left unchanged so that any mods directly using the named sound files can continue to do so unchanged.  In both cases this is to keep existing mod compatibility intact so that nil changes are required to use the library of existing mods that have been built against default. 