/*
 * generated by Xtext
 */
grammar PsiInternalMetamodelRefTestLanguage;

options {
	superClass=AbstractPsiAntlrParser;
}

@lexer::header {
package org.eclipse.xtext.metamodelreferencing.tests.idea.parser.antlr.internal;

// Hack: Use our own Lexer superclass by means of import. 
// Currently there is no other way to specify the superclass for the lexer.
import org.eclipse.xtext.parser.antlr.Lexer;
}

@parser::header {
package org.eclipse.xtext.metamodelreferencing.tests.idea.parser.antlr.internal;

import org.eclipse.xtext.idea.parser.AbstractPsiAntlrParser;
import org.eclipse.xtext.metamodelreferencing.tests.idea.lang.MetamodelRefTestLanguageElementTypeProvider;
import org.eclipse.xtext.idea.parser.TokenTypeProvider;
import org.eclipse.xtext.parser.antlr.XtextTokenStream;
import org.eclipse.xtext.parser.antlr.XtextTokenStream.HiddenTokens;
import org.eclipse.xtext.metamodelreferencing.tests.services.MetamodelRefTestLanguageGrammarAccess;

import com.intellij.lang.PsiBuilder;
}

@parser::members {

	protected MetamodelRefTestLanguageGrammarAccess grammarAccess;

	protected MetamodelRefTestLanguageElementTypeProvider elementTypeProvider;

	public PsiInternalMetamodelRefTestLanguageParser(PsiBuilder builder, TokenStream input, MetamodelRefTestLanguageElementTypeProvider elementTypeProvider, MetamodelRefTestLanguageGrammarAccess grammarAccess) {
		this(input);
		setPsiBuilder(builder);
    	this.grammarAccess = grammarAccess;
		this.elementTypeProvider = elementTypeProvider;
	}

	@Override
	protected String getFirstRuleName() {
		return "Foo";
	}

}

//Entry rule entryRuleFoo
entryRuleFoo returns [Boolean current=false]:
	{ markComposite(elementTypeProvider.getFooElementType()); }
	iv_ruleFoo=ruleFoo
	{ $current=$iv_ruleFoo.current; }
	EOF;

// Rule Foo
ruleFoo returns [Boolean current=false]
:
	(
		(
			(
				{
					markLeaf(elementTypeProvider.getFoo_NameIDTerminalRuleCall_0_0ElementType());
				}
				lv_name_0_0=RULE_ID
				{
					if(!$current) {
						associateWithSemanticElement();
						$current = true;
					}
				}
				{
					doneLeaf(lv_name_0_0);
				}
			)
		)
		(
			(
				{
					markComposite(elementTypeProvider.getFoo_NameRefsNameRefParserRuleCall_1_0ElementType());
				}
				lv_nameRefs_1_0=ruleNameRef
				{
					doneComposite();
					if(!$current) {
						associateWithSemanticElement();
						$current = true;
					}
				}
			)
		)*
	)
;

//Entry rule entryRuleNameRef
entryRuleNameRef returns [Boolean current=false]:
	{ markComposite(elementTypeProvider.getNameRefElementType()); }
	iv_ruleNameRef=ruleNameRef
	{ $current=$iv_ruleNameRef.current; }
	EOF;

// Rule NameRef
ruleNameRef returns [Boolean current=false]
:
	(
		(
			{
				if (!$current) {
					associateWithSemanticElement();
					$current = true;
				}
			}
			{
				markLeaf(elementTypeProvider.getNameRef_RuleParserRuleCrossReference_0ElementType());
			}
			otherlv_0=RULE_ID
			{
				doneLeaf(otherlv_0);
			}
		)
	)
;

RULE_ID : '^'? ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'_'|'0'..'9')*;

RULE_INT : ('0'..'9')+;

RULE_STRING : ('"' ('\\' .|~(('\\'|'"')))* '"'|'\'' ('\\' .|~(('\\'|'\'')))* '\'');

RULE_ML_COMMENT : '/*' ( options {greedy=false;} : . )*'*/';

RULE_SL_COMMENT : '//' ~(('\n'|'\r'))* ('\r'? '\n')?;

RULE_WS : (' '|'\t'|'\r'|'\n')+;

RULE_ANY_OTHER : .;
