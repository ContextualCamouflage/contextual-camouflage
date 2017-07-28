ContextualCamoCookie = function() {
  createInstance: function(attributes) {
    return {
      get: function(name) {
        return ContextualCookie.get(name);
      },
      set: function(name, value) {
        ContextualCookie.set(name, value, attributes);
      },
      remove: function(name) {
        ContextualCookie.remove(name, attributes);
      }
    }
  }
};
