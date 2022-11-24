Scriptname MCMTemplateBase Extends SKI_ConfigBase
{ Copy Paste MCM Base Script }

; --------------------- Add On System

String Property PageKey = "__MCMTemplatePages" AutoReadOnly
int Property _MAXPAGES = 100 AutoReadOnly
int Property _ActivePageID = -1 Auto Hidden

MCMTemplatePage Function GetActivePage()
	If(_ActivePageID == -1 || _ActivePageID > NumberAddOns())
		return none
	EndIf
	return StorageUtil.FormListGet(self, PageKey, _ActivePageID) as MCMTemplatePage
EndFunction

MCMTemplatePage Function FindPage(String asPage)
	Form[] mypages = StorageUtil.FormListToArray(self, PageKey)
  int i = 0
  While(i < mypages.Length)
		MCMTemplatePage page = mypages[i] as MCMTemplatePage
    If(page._PageName == asPage)
			_ActivePageID = i
      return page
    ElseIf(page._PageName == "")
      return none
    EndIf
    i += 1
  EndWhile
  return none
EndFunction

int Function NumberAddOns()
	return StorageUtil.FormListCount(self, PageKey)
EndFunction

bool Function AddNewPage(MCMTemplatePage akNewPage)
	If(NumberAddOns() >= _MAXPAGES)
		Debug.Trace("Cannot add more Pages. Page " + akNewPage " will not be added")
		return false
	ElseIf(StorageUtil.FormListAdd(self, PageKey, akNewPage, false) == -1)
		Debug.Trace("Unable to add Page " + akNewPage)
		return false
	EndIf
	SetPages()
	return true
EndFunction

Function SetPages()
	int _OffsetFirst = 0 ; Number of Pages owned by the base mod
	int _OffsetLast = 0 ; Number of Pages at the end of the MCM (post addons)
  int _NumAddons = NumberAddOns() ; Number of runtime generated pages
	Pages = Utility.CreateStringArray(_OffsetFirst + _OffsetLast + _NumAddons)
  ; -- Create Pages pre-Addon
  ; --
	int i = _OffsetFirst
	While(i < Pages.Length - _OffsetLast)
		MCMTemplatePage tmp = StorageUtil.FormListGet(self, PageKey, i - _OffsetFirst) as MCMTemplatePage
		Pages[i] = tmp._PageName
		i += 1
	EndWhile
  ; -- Create Pages post-Addon
  ; --
EndFunction

; --------------------- Menu

int Function GetVersion()
	return 1
EndFunction

Event OnVersionUpdate(int aiVersion)
EndEvent

Event OnConfigInit()
  SetPages()
EndEvent

Event OnPageReset(String asPage)
  MCMTemplatePage page = FindPage(asPage)
  If(page)
    page.OnPageReset()
  EndIf
EndEvent

; ----------------- Event States

Event OnSelectST()
	MCMTemplatePage page = GetActivePage()
	If(page)
		page.GoToState(GetState())
		page.OnSelectST()
	EndIf
EndEvent

Event OnSliderOpenST()
	MCMTemplatePage page = GetActivePage()
	If(page)
		page.GoToState(GetState())
		page.OnSliderOpenST()
	EndIf
EndEvent

Event OnSliderAcceptST(Float afValue)
	MCMTemplatePage page = GetActivePage()
	If(page)
		page.GoToState(GetState())
		page.OnSliderAcceptST(afValue)
	EndIf
EndEvent

Event OnMenuOpenST()
	MCMTemplatePage page = GetActivePage()
	If(page)
		page.GoToState(GetState())
		page.OnMenuOpenST()
	EndIf
EndEvent

Event OnMenuAcceptST(Int aiIndex)
	MCMTemplatePage page = GetActivePage()
	If(page)
		page.GoToState(GetState())
		page.OnMenuAcceptST(aiIndex)
	EndIf
EndEvent

Event OnDefaultST()
	MCMTemplatePage page = GetActivePage()
	If(page)
		page.GoToState(GetState())
		page.OnDefaultST()
	EndIf
EndEvent

Event OnColorOpenST()
	MCMTemplatePage page = GetActivePage()
	If(page)
		page.GoToState(GetState())
		page.OnColorOpenST()
	EndIf
EndEvent

Event OnColorAcceptST(int aiColor)
	MCMTemplatePage page = GetActivePage()
	If(page)
		page.GoToState(GetState())
		page.OnColorAcceptST(aiColor)
	EndIf
EndEvent

Event OnKeyMapChangeST(int aiKeyCode, string asConflictControl, string asConflictName)
	MCMTemplatePage page = GetActivePage()
	If(page)
		page.GoToState(GetState())
		page.OnKeyMapChangeST(aiKeyCode, asConflictControl, asConflictName)
	EndIf
EndEvent

Event OnInputOpenST()
	MCMTemplatePage page = GetActivePage()
	If(page)
		page.GoToState(GetState())
		page.OnInputOpenST()
	EndIf
EndEvent

Event OnInputAcceptST(string asInput)
	MCMTemplatePage page = GetActivePage()
	If(page)
		page.GoToState(GetState())
		page.OnInputAcceptST(asInput)
	EndIf
EndEvent

Event OnHighlightST()
	MCMTemplatePage page = GetActivePage()
	If(page)
		page.GoToState(GetState())
		page.OnHighlightST()
	EndIf
EndEvent

; ----------------- Legacy Events

Event OnOptionSelect(int aiOption)
	MCMTemplatePage page = GetActivePage()
	If(page)
		page.OnOptionSelect(aiOption)
	EndIf
EndEvent

Event OnOptionDefault(int aiOption)
	MCMTemplatePage page = GetActivePage()
	If(page)
		page.OnOptionDefault(aiOption)
	EndIf
EndEvent

Event OnOptionSliderOpen(int aiOption)
	MCMTemplatePage page = GetActivePage()
	If(page)
		page.OnOptionSliderOpen(aiOption)
	EndIf
EndEvent

Event OnOptionSliderAccept(int aiOption, float afValue)
	MCMTemplatePage page = GetActivePage()
	If(page)
		page.OnOptionSliderAccept(aiOption, afValue)
	EndIf
EndEvent

Event OnOptionMenuOpen(int aiOption)
	MCMTemplatePage page = GetActivePage()
	If(page)
		page.OnOptionMenuOpen(aiOption)
	EndIf
EndEvent

Event OnOptionMenuAccept(int aiOption, int aiIndex)
	MCMTemplatePage page = GetActivePage()
	If(page)
		page.OnOptionMenuAccept(aiOption, aiIndex)
	EndIf
EndEvent

Event OnOptionColorOpen(int aiOption)
	MCMTemplatePage page = GetActivePage()
	If(page)
		page.OnOptionColorOpen(aiOption)
	EndIf
EndEvent

Event OnOptionColorAccept(int aiOption, int aiColor)
	MCMTemplatePage page = GetActivePage()
	If(page)
		page.OnOptionColorAccept(aiOption, aiColor)
	EndIf
EndEvent

Event OnOptionKeyMapChange(int aiOption, int aiKeyCode, string asConflictControl, string asConflictName)
	MCMTemplatePage page = GetActivePage()
	If(page)
		page.OnOptionKeyMapChange(aiOption, aiKeyCode, asConflictControl, asConflictName)
	EndIf
EndEvent

Event OnOptionInputOpen(int aiOption)
	MCMTemplatePage page = GetActivePage()
	If(page)
		page.OnOptionInputOpen(aiOption)
	EndIf
EndEvent

Event OnOptionInputAccept(int aiOption, string asInput)
	MCMTemplatePage page = GetActivePage()
	If(page)
		page.OnOptionInputAccept(aiOption, asInput)
	EndIf
EndEvent

Event OnOptionHighlight(int aiOption)
	MCMTemplatePage page = GetActivePage()
	If(page)
		page.OnOptionHighlight(aiOption)
	EndIf
EndEvent
