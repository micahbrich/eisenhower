<img src="https://github.com/micahbrich/eisenhower/raw/gh-pages/public/images/portrait-header.jpg" alt="Eisenhower">

Eisenhower is a work-in-progress read-only rubygem to help you work the
[Interstate API](http://developers.interstateapp.com).

Install
-------

    gem install 'eisenhower'

Usage
----

First thing to do is set an OAuth token – how you get this, at the moment, is up to you.

    Eisenhower.oauth_token = "432n4u3h24v23"

Now you can get all your roadmaps!

    Eisenhower::Roadmap.all

You’ll get back interconnected **Eisenhower** objects whenever possible. Try this to get all the roads on a specific roadmap:

    map = Eisenhower::Roadmap.all.first 
    map = Eisenhower::Roadmap.find("234f23f23fc2fg")
    
        #<Eisenhower::Roadmap:0x00000100964028 
            @id="4d86bd5a36c040e22c000285", 
            @app_id="4d86bd5a36c040e22c000283", 
            @archived=false, 
            @public=nil, 
            @title="Your first roadmap", 
            @staff_ids=["4d86bd5a36c040e22c000284", "4d90e61336c040672d00035e"]>
    
    map.roads 
        
        [#<Eisenhower::Road:0x000001009156d0 
            @id="4d86bd5a36c040e22c000287", 
            @title="This is a road", 
            @description="A road is usually the name of a feature that you're building. Etc, etc.", 
            @description_html="<p>A road is usually the name of a feature that you're building. Etc, etc.</p>", 
            @collapsed=false, 
            @status="Launched", 
            @due=false, 
            @started=false, 
            @position=0, 
            @updates_count=0, 
            @update_ids=[], 
            @staff_ids=["4d86bd5a36c040e22c000284"]>]
            
    map.roads.first.title
    
        "This is a road" 
        
    map.roads.first.staff
    
        [#<Eisenhower::Staff:0x000001019d9548 
            @id="4d86bd5a36c040e22c000284", 
            @full_name="Micah Rich", 
            @email=nil, 
            @admin=true>]
            
    And so on.


Double check the code, but most attributes are from Interstate's documentation:

1.  [Roadmaps](http://developers.interstateapp.com/roadmap/get)
2.  [Roads](http://developers.interstateapp.com/road/get)
3.  [Road Updates](http://developers.interstateapp.com/update/get)
4.  [Staff](http://developers.interstateapp.com/staff/get)


To Do
-----

There’s much left to do, so please feel free
to fork it & help out.

- **Refactor** - There are too many API calls, which makes getting simple information slow. API calls inside API calls gets ugly, and there’s a lot of information that could be instantiated without an extra call.

- **Tests** - I'm a designer, and am subsequently despicable at writing tests. Please help.

- **Implement newer API objects** - There are now at least two more objects (File & Activity) that I haven’t touched yet.

- **Writing as well as Reading** - The only reason Eisenhower is read-only is because that’s all I’ve found time to do so far. Help here would be swell.

- - -

Perhaps together, we can get it up to version one.
