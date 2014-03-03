## TODO

- [ ] have overridable section use their own identifiers, not expressions.
- [ ] examine dependencies using https://github.com/nst/objc_dep $ python objc_dep.py -x "(GRMustacheAvailabilityMacros)" ~/Documents/git/groue/GRMustache/src/classes/ > ~/Desktop/GRMustacheDeps.dot
- [ ] Fetch inspiration from "faster mutable strings" in fotonauts/handlebars-objc (https://github.com/fotonauts/handlebars-objc/commit/f2cbde7e12b1fb594c2807a57bd2ecd2adb839b4)
- [X] Introduce [GRMustacheTagDelegate mustacheTag:willRender:] in order to let tag delegate process the rendering of inner tags
- [X] Remove GRMustacheContext subclasses.
- [X] safe property access (https://github.com/fotonauts/handlebars-objc/blob/master/doc/ContextObjects.md#why-does-handlebars-limit-access-to-some-attributes-that-are-normally-accessible-using-key-value-coding)

## Nice to have

- [ ] document migration path from all previous versions to latest version
- [ ] > But they do allow Xcode to see the symbols when creating the final executable and allow the static library symbols to get included in the final DSYM file thereby allowing full symoblication of crash reports. (https://github.com/RestKit/RestKit/issues/1277)

## Experiments

- [ ] {{.}}, {{..}}, {{...}}, {{.name}}, {{..name}}, {{...name}}, {{ROOT}}, {{ROOT.name}}
- [ ] Have filters put something in the scope: in `{{ dateFormat(date, ISO_8601) }}`, ISO_8601 would be defined by the dateFormat filter.
- [ ] date/time formatter: `{{ dateFormat(date, Short) }}`, `{{ timeFormat(date, Short) }}`, `{{ dateTimeFormat(date, Short, Full) }}`