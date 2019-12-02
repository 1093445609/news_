//大于
Handlebars.registerHelper("gt", function(v1, v2, options) {
	if (v1 > v2) {
		// 满足条件继续执行
		return options.fn(this);
	} else {
		// 不满足条件执行{{else}}部分
		return options.inverse(this);
	}
});
// 小于
Handlebars.registerHelper("lt", function(v1, v2, options) {
	if (v1 < v2) {
		// 满足条件继续执行
		return options.fn(this);
	} else {
		// 不满足条件执行{{else}}部分
		return options.inverse(this);
	}
});
// 等于
Handlebars.registerHelper("eq", function(v1, v2, options) {
	if (v1 == v2) {
		// 满足条件继续执行
		return options.fn(this);
	} else {
		// 不满足条件执行{{else}}部分
		return options.inverse(this);
	}
});
// 间隔n行
Handlebars.registerHelper("addspace", function(v1, v2, options) {
	if ((v1 + 1) % v2 == 0) {
		// 满足条件继续执行
		return options.fn(this);
	} else {
		// 不满足条件执行{{else}}部分
		return options.inverse(this);
	}
});
// 加一
Handlebars.registerHelper("addone", function(value) {
	return value + 1;
});