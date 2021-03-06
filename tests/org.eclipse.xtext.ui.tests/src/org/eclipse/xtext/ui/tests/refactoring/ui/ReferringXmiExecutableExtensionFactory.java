/*******************************************************************************
 * Copyright (c) 2010 itemis AG (http://www.itemis.eu) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/
package org.eclipse.xtext.ui.tests.refactoring.ui;

import static com.google.inject.Guice.*;
import static com.google.inject.util.Modules.*;

import org.eclipse.xtext.ui.guice.AbstractGuiceAwareExecutableExtensionFactory;
import org.eclipse.xtext.ui.resource.generic.EmfUiModule;
import org.eclipse.xtext.ui.tests.Activator;
import org.eclipse.xtext.ui.tests.refactoring.ReferringXmiResourceModule;
import org.osgi.framework.Bundle;

import com.google.inject.Injector;

/**
 * @author Jan Koehnlein - Initial contribution and API
 */
public class ReferringXmiExecutableExtensionFactory extends AbstractGuiceAwareExecutableExtensionFactory {

	@Override
	protected Bundle getBundle() {
		return Activator.getInstance().getBundle();
	}

	@Override
	protected Injector getInjector() {
		return createInjector(override(
				override(new ReferringXmiResourceModule()).with(new org.eclipse.xtext.ui.shared.SharedStateModule()))
				.with(new EmfUiModule(Activator.getInstance())));
	}

}
