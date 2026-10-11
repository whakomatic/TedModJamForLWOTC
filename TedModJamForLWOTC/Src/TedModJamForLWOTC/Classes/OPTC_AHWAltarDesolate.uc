// Requiem Legion: Coarse Edition builds AHWAltarDesolate with no ability trigger, so the template
// fails validation ("no Triggers") and the Altar can never fire its burst.
class OPTC_AHWAltarDesolate extends X2DownloadableContentInfo;

static event OnPostTemplatesCreated()
{
	local X2AbilityTemplateManager		AbilityTemplateManager;
	local X2AbilityTemplate				Template;

	AbilityTemplateManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();
	Template = AbilityTemplateManager.FindAbilityTemplate('AHWAltarDesolate');

	if(Template != None && Template.AbilityTriggers.Length == 0)
	{
		Template.AbilityTriggers.AddItem(new class'X2AbilityTrigger_PlayerInput');
	}
}
