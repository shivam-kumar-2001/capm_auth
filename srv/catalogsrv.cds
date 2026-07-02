using {db.booksdatamodelNamespace as myBooks} from '../db/datamodel';

service BooksService @(requires : 'authenticated-user' ) {
    entity BooksSet @(
        restrict :[
            {grant : ['READ','WRITE'] , to : 'Admin' },
            {grant : ['READ'] , to : 'Kids' ,where : 'bookAgeGroup=$user.bookAgeGroup'},
            {grant : ['READ'] , to : 'Adult' ,where : 'bookAgeGroup=$user.bookAgeGroup'},
        ]
    ) as projection on myBooks.books;
}


annotate myBooks.books with @(UI: {
    SelectionFields        : [
        ID,
        Title,
        author
    ],
    LineItem               : [
        {
            $Type: 'UI.DataField',
            Value: ID
        },
        {
            $Type: 'UI.DataField',
            Value: Title
        },
        {
            $Type: 'UI.DataField',
            Value: author
        },
        {
            $Type: 'UI.DataField',
            Value: publishdate
        },
        {
            $Type: 'UI.DataField',
            Value: digitalCopy
        },
        {
            $Type: 'UI.DataField',
            Value: bookAgeGroup
        },
    ],
    HeaderInfo             : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Sales Order',
        TypeNamePlural: 'Sales Order',
        Title         : {
            $Type: 'UI.DataField',
            Value: Title
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: author
        }
    },
    Facets                 : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'General Information',
        Target: '@UI.FieldGroup#GeneralInfo'
    }],
    FieldGroup #GeneralInfo: {Data: [
        {
            $Type: 'UI.DataField',
            Value: ID,
            Label: 'ID'
        },
        {
            $Type: 'UI.DataField',
            Value: Title,
            Label: 'Title'
        },
        {
            $Type: 'UI.DataField',
            Value: author,
            Label: 'Author'
        },
        {
            $Type: 'UI.DataField',
            Value: price,
            Label: 'Price'
        },
        {
            $Type: 'UI.DataField',
            Value: publishdate,
            Label: 'Publish Date'
        },
        {
            $Type: 'UI.DataField',
            Value: digitalCopy,
            Label: 'Digital Copy'
        },
          {
            $Type: 'UI.DataField',
            Value: bookAgeGroup,
            Label: 'Age Group'
        }
    ]}

});
