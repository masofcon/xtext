/*
 * generated by Xtext
 */
package org.eclipse.xtext.testlanguages.backtracking.idea

import com.google.inject.Guice
import org.eclipse.xtext.testlanguages.backtracking.BeeLangTestLanguageRuntimeModule
import org.eclipse.xtext.testlanguages.backtracking.BeeLangTestLanguageStandaloneSetupGenerated
import org.eclipse.xtext.util.Modules2

class BeeLangTestLanguageStandaloneSetupIdea extends BeeLangTestLanguageStandaloneSetupGenerated {
	override createInjector() {
		val runtimeModule = new BeeLangTestLanguageRuntimeModule()
		val ideaModule = new BeeLangTestLanguageIdeaModule()
		val mergedModule = Modules2.mixin(runtimeModule, ideaModule)
		return Guice.createInjector(mergedModule)
	}
}
