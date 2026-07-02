sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"books1/test/integration/pages/BooksSetList",
	"books1/test/integration/pages/BooksSetObjectPage"
], function (JourneyRunner, BooksSetList, BooksSetObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('books1') + '/test/flpSandbox.html#books1-tile',
        pages: {
			onTheBooksSetList: BooksSetList,
			onTheBooksSetObjectPage: BooksSetObjectPage
        },
        async: true
    });

    return runner;
});

