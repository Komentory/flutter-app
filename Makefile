.PHONY: metrics analyze unused_files unused_l10n

analyze:
	flutter pub run dart_code_metrics:metrics analyze lib

unused_files:
	flutter pub run dart_code_metrics:metrics \
		check-unused-files --exclude="lib/generated_*.dart" lib

unused_l10n:
	flutter pub run dart_code_metrics:metrics check-unused-l10n lib

metrics: analyze unused_files unused_l10n

splash_create:
	flutter pub run flutter_native_splash:create