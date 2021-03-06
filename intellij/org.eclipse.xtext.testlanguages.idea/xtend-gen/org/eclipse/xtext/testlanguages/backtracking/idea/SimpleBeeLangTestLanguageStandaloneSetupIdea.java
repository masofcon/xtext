/**
 * generated by Xtext
 */
package org.eclipse.xtext.testlanguages.backtracking.idea;

import com.google.inject.Guice;
import com.google.inject.Injector;
import com.google.inject.Module;
import org.eclipse.xtext.testlanguages.backtracking.SimpleBeeLangTestLanguageRuntimeModule;
import org.eclipse.xtext.testlanguages.backtracking.SimpleBeeLangTestLanguageStandaloneSetupGenerated;
import org.eclipse.xtext.testlanguages.backtracking.idea.SimpleBeeLangTestLanguageIdeaModule;
import org.eclipse.xtext.util.Modules2;

@SuppressWarnings("all")
public class SimpleBeeLangTestLanguageStandaloneSetupIdea extends SimpleBeeLangTestLanguageStandaloneSetupGenerated {
  @Override
  public Injector createInjector() {
    final SimpleBeeLangTestLanguageRuntimeModule runtimeModule = new SimpleBeeLangTestLanguageRuntimeModule();
    final SimpleBeeLangTestLanguageIdeaModule ideaModule = new SimpleBeeLangTestLanguageIdeaModule();
    final Module mergedModule = Modules2.mixin(runtimeModule, ideaModule);
    return Guice.createInjector(mergedModule);
  }
}
