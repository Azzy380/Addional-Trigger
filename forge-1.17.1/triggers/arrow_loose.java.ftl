<#include "procedures.java.ftl">
@Mod.EventBusSubscriber public class ${name}Procedure {
	private static ArrowLooseEvent _event;
	@SubscribeEvent public static void onPlayerStopUsingBowItem(ArrowLooseEvent event) {
		_event = event;
		Player entity = event.getPlayer();
		<#assign dependenciesCode><#compress>
			<@procedureDependenciesCode dependencies, {
			"x": "entity.getX()",
			"y": "entity.getY()",
			"z": "entity.getZ()",
			"world": "entity.level",
			"dimension": "event.getDimension()",
			"entity": "entity",
			"bowItem": "event.getBow()",
			"hasAmmo": "event.hasAmmo()",
			"charge": "event.getCharge()"
			}/>
		</#compress></#assign>
		execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
	}