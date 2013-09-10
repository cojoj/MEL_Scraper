MEL_Scraper
===

MEL_Scraper is a simple Ruby script which is resposible for [scraping](http://en.wikipedia.org/wiki/Web_scraping) 
[MEL](http://en.wikipedia.org/wiki/Master_minimum_equipment_list) from [this site](http://www.s-techent.com/ATA100.htm).

---

This script is downloading HTML source and using [Nokogiri](http://nokogiri.org) it is scraping the table which has more than one `TR`.
After this simple operation we have the secondl table (this with all MMELs) on a plate and ready to be formed into [JSON](http://www.json.org). We take each `TD` and determine whether it is empty or has some sort of data.

---

**Structure of generated JSON file**(using chapter 7 as an example):

    {
	  "chapter":"07",
	  "title":"LIFTING AND SHORING",
	  "description":"This chapter shall...",
	  "section":[
	    {
	      "number":"00",
	      "title":"GENERAL",
	      "description":"",
	    },

	    {
	      "number":"10",
	      "title":"JACKING",
	      "description":"Provides information relative...",
	    },

	    {
	      "number":"20",
	      "title":"SHORING",
	      "description":"Those instructions necessary...",
	    }
	  ]
	}