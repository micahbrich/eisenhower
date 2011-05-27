<img src="https://github.com/micahbrich/eisenhower/raw/gh-pages/public/images/portrait-header.jpg" alt="Eisenhower">

Eisenhower is a work-in-progress read-only rubygem to help you work the
[Interstate API](http://developers.interstateapp.com).

- - -

First thing to do is set an OAuth token – how you get this, at the moment, is up to you.

    Eisenhower.oauth_token = "432n4u3h24v23"

Now you can get all your roadmaps!

    Eisenhower::Roadmap.all

You’ll get back interconnected **Eisenhower** objects whenever possible. Try this to get all the roads on a specific roadmap:

    map = Eisenhower::Roadmap.all.first 
    map = Eisenhower::Roadmap.find("234f23f23fc2fg") 
    map.roads 

Double check the code, but most attributes are from Interstate's documentation:

1.  [Roadmaps](http://developers.interstateapp.com/roadmap/get)
2.  [Roads](http://developers.interstateapp.com/road/get)
3.  [Road Updates](http://developers.interstateapp.com/update/get)
4.  [Staff](http://developers.interstateapp.com/staff/get)

- - -

There’s much left to do, so please feel free
to fork it & help out.

#### Refactor

There are too many API calls, which makes getting simple information slow. API calls inside API calls gets ugly, and there’s a lot of information that could be instantiated without an extra call.

#### Tests
I'm a designer, and am subsequently despicable at writing tests. Please help.

#### Implement newer API objects

There are now at least two more objects (File & Activity) that I haven’t touched yet.

#### Writing as well as Reading

The only reason Eisenhower is read-only is because that’s all I’ve found time to do so far. Help here would be swell.

