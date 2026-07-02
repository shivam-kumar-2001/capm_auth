sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'books1',
            componentId: 'BooksSetList',
            contextPath: '/BooksSet'
        },
        CustomPageDefinitions
    );
});