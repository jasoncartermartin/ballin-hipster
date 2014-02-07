var opts = {
  container: 'epiceditor',
  textarea: 'wiki_body',
  basePath: 'epiceditor',
  clientSideStorage: false,
  localStorageName: 'epiceditor',
  useNativeFullscreen: true,
  parser: marked,
  file: {
    name: 'epiceditor',
    defaultContent: '',
    autoSave: 100
  },
  theme: {
    base: "http://localhost:3000/assets/themes/base/epiceditor.css",
    preview: "http://localhost:3000/assets/themes/preview/github.css",
    editor: "http://localhost:3000/assets/themes/editor/epic-dark.css"
  },
  button: {
    preview: true,
    fullscreen: true,
    bar: "auto"
  },
  focusOnLoad: false,
  shortcut: {
    modifier: 18,
    fullscreen: 70,
    preview: 80
  },
  string: {
    togglePreview: 'Toggle Preview Mode',
    toggleEdit: 'Toggle Edit Mode',
    toggleFullscreen: 'Enter Fullscreen'
  },
  autogrow: { 
    minHeight: 80, 
    maxHeight: 600,
    scroll: true
  }
}

$(document).ready(function() {
  //var editor = new EpicEditor().load();
  if ($("#epiceditor").length)
    var editor = new EpicEditor(opts).load();
});