<#include "procedures.java.ftl">
@Mod.EventBusSubscriber public class ${name}Procedure {
	private static PlayerEvent.BreakSpeed _event;
	@SubscribeEvent public static void onPlayerBreakSpeed(PlayerEvent.BreakSpeed event) {
		_event = event;
		Entity entity = event.getPlayer();
		<#assign dependenciesCode><#compress>
			<@procedureDependenciesCode dependencies, {
			"x": "entity.getX()",
			"y": "entity.getY()",
			"z": "entity.getZ()",
			"world": "entity.level",
			"dimension": "event.getDimension()",
			"entity": "entity",
			"speed": "event.getOriginalSpeed()",
			"blockstate": "event.getState()"
			}/>
		</#compress></#assign>
		execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
	}