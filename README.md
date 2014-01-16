# IFrame Session

IFrame Session is a gem that allows problematic web browsers (Internet Explorer and Safari) to use same cookies in iframes as in parent windows.

**The gem is Rails-dependent**

## Installation

Add this line to your application's Gemfile:

    gem 'iframe_session', git: 'git://github.com/LiveTyping/iframe_session.git'

And then execute:

    $ bundle

## Usage example

Add call of `iframe_session_fix(redirect_path, options = {})` method on the controller your `root_path` points to.

* `redirect_path` is the parent iframe path
* `options` is the options hash as for `before_action` call

Let's pretend your parent iframe path is `http://example.com/` and your `routes.rb` looks like:

```
...
root 'home#index'
...
```
In this case your `home_controller.rb `should look like:
```
class HomeController < ApplicationController
  iframe_session_fix 'http://example.com/', only: :index

  def index
    ...
  end
  ...
end
```
