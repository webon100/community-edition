model.jsonModel = {
   services: [
      {
         name: "alfresco/services/LoggingService",
         config: {
            loggingPreferences: {
               enabled: true,
               all: true,
               warn: true,
               error: true
            }
         }
      },
      "alfresco/services/ErrorReporter"
   ],
   widgets: [
      {
         name: "alfresco/layout/VerticalWidgets",
         config: {
            widgets: [
               {
                  id: "TOOLBAR",
                  name: "alfresco/documentlibrary/AlfToolbar"
               },
               {
                  id: "DOCLIST",
                  name: "alfresco/lists/AlfList",
                  config: {
                     useHash: false,
                     additionalControlsTarget: "TOOLBAR",
                     currentData: {
                        items: [
                           {
                              displayName: "Folder 1",
                              nodeRef: "dummy://nodeRef/1",
                              type: "folder"
                           },
                           {
                              displayName: "Blog Post",
                              nodeRef: "dummy://nodeRef/2",
                              type: "blogpost"
                           },
                           {
                              displayName: "Forum Post",
                              nodeRef: "dummy://nodeRef/3",
                              type: "forumpost"
                           },
                           {
                              displayName: "Calendar Event",
                              nodeRef: "dummy://nodeRef/4",
                              type: "calendarevent"
                           },
                           {
                              displayName: "Wiki Page",
                              nodeRef: "dummy://nodeRef/5",
                              type: "wikipage"
                           },
                           {
                              displayName: "Link",
                              nodeRef: "dummy://nodeRef/6",
                              type: "link"
                           },
                           {
                              displayName: "Data List",
                              nodeRef: "dummy://nodeRef/7",
                              type: "datalist"
                           },
                           {
                              displayName: "Data List Item",
                              nodeRef: "dummy://nodeRef/8",
                              type: "datalistitem"
                           },
                           {
                              displayName: "Folder 2",
                              nodeRef: "dummy://nodeRef/9",
                              type: "folder"
                           },
                           {
                              displayName: "Folder 3",
                              nodeRef: "dummy://nodeRef/10",
                              type: "folder"
                           },
                           {
                              displayName: "Folder 4",
                              nodeRef: "dummy://nodeRef/11",
                              type: "folder"
                           }
                        ]
                     },
                     widgets: [
                        {
                           name: "alfresco/documentlibrary/views/AlfGalleryView",
                           config: {
                              widgets: [
                                 {
                                    name: "alfresco/search/SearchGalleryThumbnail"
                                 }
                              ]
                           }
                        }
                     ]
                  }
               }
            ]
         }
      },
      {
         name: "alfresco/logging/SubscriptionLog"
      },
      {
         name: "aikauTesting/TestCoverageResults"
      }
   ]
};