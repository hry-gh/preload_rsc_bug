#define PRELOAD_URL "https://github.com/hry-gh/preload_rsc_bug/releases/download/test-data/preload_test.zip"

/world
	maxx = 5
	maxy = 5
	maxz = 1
	view = 2

/client
#ifdef SET_AT_RUNTIME
	preload_rsc = 0
#else
	preload_rsc = PRELOAD_URL
#endif

/client/New()
#ifdef SET_AT_RUNTIME
	preload_rsc = PRELOAD_URL
#endif
	world.log << "[time2text(world.timeofday, "hh:mm:ss")] client/New: [key] (preload_rsc = [preload_rsc])"
	return ..()

/client/Del()
	world.log << "[time2text(world.timeofday, "hh:mm:ss")] client/Del: [key]"
	return ..()

/mob/Login()
	..()
	loc = locate(3, 3, 1)
	world.log << "[time2text(world.timeofday, "hh:mm:ss")] Login: [key]"

	for(var/i in 1 to 5)
		var/obj/O = new(locate(i, 4, 1))
		O.icon = test_icons[i]
	src << "Login reached. If the map is showing, the preload finished or was skipped."
