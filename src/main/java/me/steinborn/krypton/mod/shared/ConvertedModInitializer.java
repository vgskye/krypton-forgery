package me.steinborn.krypton.mod.shared;

public abstract class ConvertedModInitializer {

	public ConvertedModInitializer() {
		onInitialize();
	}

	public abstract void onInitialize();

}
