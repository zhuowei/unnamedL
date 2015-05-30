#include <dlfcn.h>
#include <android/log.h>
#include <string.h>
static void* realNvOs;

void* NvOsLibraryLoad(const char* name, void** ptrToHandle) {
	static void* (*real)(const char*, void**);
	__android_log_print(ANDROID_LOG_ERROR, "Preload", "NvOsLibraryLoad: %s", name);
	if (!realNvOs) {
		realNvOs = dlopen("libnvos.so", RTLD_LAZY);
	}
	if (!real) {
		real = dlsym(realNvOs, "NvOsLibraryLoad");
	}
/*
	const char* err = dlerror();
	if (err) {
		__android_log_print(ANDROID_LOG_ERROR, "Preload", "before: %s", err);
	}
*/
	if (!strcmp(name, "egl/libGLESv2_tegra")) {
		name = "/system/lib/egl/libGLESv2_tegra";
	} else if (!strcmp(name, "egl/libGLESv1_CM_tegra")) {
		name = "/system/lib/egl/libGLESv1_CM_tegra";
	} else if (!strcmp(name, "egl/libEGL_tegra")) {
		name = "/system/lib/egl/libEGL_tegra";
	}
	void* ret = real(name, ptrToHandle);
/*	err = dlerror();
	if (err) {
		__android_log_print(ANDROID_LOG_ERROR, "Preload", "%s", err);
	}
	__android_log_print(ANDROID_LOG_ERROR, "Preload", "Finished loading: return = %p, handle = %p", ret, *ptrToHandle);
*/
	return ret;
}
/*
void* NvOsLibraryGetSymbol(void* handle, const char* name) {
	static void* (*real)(void*, const char*);
	__android_log_print(ANDROID_LOG_ERROR, "Preload", "NvOsLibraryGetSymbol: %p %s", handle, name);
	if (!realNvOs) {
		realNvOs = dlopen("libnvos.so", RTLD_LAZY);
	}
	if (!real) {
		real = dlsym(realNvOs, "NvOsLibraryGetSymbol");
	}
	const char* err = dlerror();
	if (err) {
		__android_log_print(ANDROID_LOG_ERROR, "Preload", "before: %s", err);
	}
	void* ret = real(handle, name);
	err = dlerror();
	if (err) {
		__android_log_print(ANDROID_LOG_ERROR, "Preload", "%s", err);
	}
	return ret;
}
*/
