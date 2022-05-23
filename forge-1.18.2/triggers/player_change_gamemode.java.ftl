<#include "procedures.java.ftl">
@Mod.EventBusSubscriber public class ${name}Procedure {
	private static PlayerEvent.PlayerChangeGameModeEvent _event;
	@SubscribeEvent public static void onPlayerGamemodeChange(PlayerEvent.PlayerChangeGameModeEvent event) {
		_event = event;
		Player player = event.getPlayer();
		<#assign dependenciesCode><#compress>
			<@procedureDependenciesCode dependencies, {
			"x": "player.getX()",
			"y": "player.getY()",
			"z": "player.getZ()",
			"entity": "player",
			"world": "event.getWorld()",
			"dimension": "event.getDimension()"
			}/>
		</#compress></#assign>
		execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
	}