<#include "procedures.java.ftl">
@Mod.EventBusSubscriber public class ${name}Procedure {
	private static AnvilRepairEvent _event;
	@SubscribeEvent public static void onAnvilRepair(AnvilRepairEvent event) {
		_event = event;
		Player entity = event.getPlayer();
		<#assign dependenciesCode><#compress>
			<@procedureDependenciesCode dependencies, {
			"breakChance": "event.getBreakChance()",
			"left": "event.getItemInput()",
			"right": "event.getIngredientInput()",
			"output": "event.getItemResult()",
			"x": "entity.getX()",
			"y": "entity.getY()",
			"z": "entity.getZ()",
			"world": "entity.level",
			"dimension": "event.getDimension()"
			}/>
		</#compress></#assign>
		execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
	}
