/*
 * generated by Xtext
 */
grammar PsiInternalLangATestLanguage;

options {
	superClass=AbstractPsiAntlrParser;
}

@lexer::header {
package org.eclipse.xtext.linking.idea.parser.antlr.internal;

// Hack: Use our own Lexer superclass by means of import. 
// Currently there is no other way to specify the superclass for the lexer.
import org.eclipse.xtext.parser.antlr.Lexer;
}

@parser::header {
package org.eclipse.xtext.linking.idea.parser.antlr.internal;

import org.eclipse.xtext.idea.parser.AbstractPsiAntlrParser;
import org.eclipse.xtext.linking.idea.lang.LangATestLanguageElementTypeProvider;
import org.eclipse.xtext.idea.parser.TokenTypeProvider;
import org.eclipse.xtext.parser.antlr.XtextTokenStream;
import org.eclipse.xtext.parser.antlr.XtextTokenStream.HiddenTokens;
import org.eclipse.xtext.linking.services.LangATestLanguageGrammarAccess;

import com.intellij.lang.PsiBuilder;
}

@parser::members {

	protected LangATestLanguageGrammarAccess grammarAccess;

	protected LangATestLanguageElementTypeProvider elementTypeProvider;

	public PsiInternalLangATestLanguageParser(PsiBuilder builder, TokenStream input, LangATestLanguageElementTypeProvider elementTypeProvider, LangATestLanguageGrammarAccess grammarAccess) {
		this(input);
		setPsiBuilder(builder);
    	this.grammarAccess = grammarAccess;
		this.elementTypeProvider = elementTypeProvider;
	}

	@Override
	protected String getFirstRuleName() {
		return "Main";
	}

}

//Entry rule entryRuleMain
entryRuleMain returns [Boolean current=false]:
	{ markComposite(elementTypeProvider.getMainElementType()); }
	iv_ruleMain=ruleMain
	{ $current=$iv_ruleMain.current; }
	EOF;

// Rule Main
ruleMain returns [Boolean current=false]
:
	(
		(
			(
				{
					markComposite(elementTypeProvider.getMain_ImportsImportParserRuleCall_0_0ElementType());
				}
				lv_imports_0_0=ruleImport
				{
					doneComposite();
					if(!$current) {
						associateWithSemanticElement();
						$current = true;
					}
				}
			)
		)*
		(
			(
				{
					markComposite(elementTypeProvider.getMain_TypesTypeParserRuleCall_1_0ElementType());
				}
				lv_types_1_0=ruleType
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

//Entry rule entryRuleImport
entryRuleImport returns [Boolean current=false]:
	{ markComposite(elementTypeProvider.getImportElementType()); }
	iv_ruleImport=ruleImport
	{ $current=$iv_ruleImport.current; }
	EOF;

// Rule Import
ruleImport returns [Boolean current=false]
:
	(
		{
			markLeaf(elementTypeProvider.getImport_ImportKeyword_0ElementType());
		}
		otherlv_0='import'
		{
			doneLeaf(otherlv_0);
		}
		(
			(
				{
					markLeaf(elementTypeProvider.getImport_UriSTRINGTerminalRuleCall_1_0ElementType());
				}
				lv_uri_1_0=RULE_STRING
				{
					if(!$current) {
						associateWithSemanticElement();
						$current = true;
					}
				}
				{
					doneLeaf(lv_uri_1_0);
				}
			)
		)
	)
;

//Entry rule entryRuleType
entryRuleType returns [Boolean current=false]:
	{ markComposite(elementTypeProvider.getTypeElementType()); }
	iv_ruleType=ruleType
	{ $current=$iv_ruleType.current; }
	EOF;

// Rule Type
ruleType returns [Boolean current=false]
:
	(
		{
			markLeaf(elementTypeProvider.getType_TypeKeyword_0ElementType());
		}
		otherlv_0='type'
		{
			doneLeaf(otherlv_0);
		}
		(
			(
				{
					markLeaf(elementTypeProvider.getType_NameIDTerminalRuleCall_1_0ElementType());
				}
				lv_name_1_0=RULE_ID
				{
					if(!$current) {
						associateWithSemanticElement();
						$current = true;
					}
				}
				{
					doneLeaf(lv_name_1_0);
				}
			)
		)
		(
			{
				markLeaf(elementTypeProvider.getType_ExtendsKeyword_2_0ElementType());
			}
			otherlv_2='extends'
			{
				doneLeaf(otherlv_2);
			}
			(
				(
					{
						if (!$current) {
							associateWithSemanticElement();
							$current = true;
						}
					}
					{
						markLeaf(elementTypeProvider.getType_ExtendsTypeCrossReference_2_1_0ElementType());
					}
					otherlv_3=RULE_ID
					{
						doneLeaf(otherlv_3);
					}
				)
			)
		)?
		(
			{
				markLeaf(elementTypeProvider.getType_ImplementsKeyword_3_0ElementType());
			}
			otherlv_4='implements'
			{
				doneLeaf(otherlv_4);
			}
			(
				(
					{
						if (!$current) {
							associateWithSemanticElement();
							$current = true;
						}
					}
					{
						markLeaf(elementTypeProvider.getType_ImplementsTypeCrossReference_3_1_0ElementType());
					}
					otherlv_5=RULE_ID
					{
						doneLeaf(otherlv_5);
					}
				)
			)
			(
				{
					markLeaf(elementTypeProvider.getType_CommaKeyword_3_2_0ElementType());
				}
				otherlv_6=','
				{
					doneLeaf(otherlv_6);
				}
				(
					(
						{
							if (!$current) {
								associateWithSemanticElement();
								$current = true;
							}
						}
						{
							markLeaf(elementTypeProvider.getType_ImplementsTypeCrossReference_3_2_1_0ElementType());
						}
						otherlv_7=RULE_ID
						{
							doneLeaf(otherlv_7);
						}
					)
				)
			)*
		)?
	)
;

RULE_ID : '^'? ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'_'|'0'..'9')*;

RULE_INT : ('0'..'9')+;

RULE_STRING : ('"' ('\\' .|~(('\\'|'"')))* '"'|'\'' ('\\' .|~(('\\'|'\'')))* '\'');

RULE_ML_COMMENT : '/*' ( options {greedy=false;} : . )*'*/';

RULE_SL_COMMENT : '//' ~(('\n'|'\r'))* ('\r'? '\n')?;

RULE_WS : (' '|'\t'|'\r'|'\n')+;

RULE_ANY_OTHER : .;
