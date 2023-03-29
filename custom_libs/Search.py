from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn

@library
class Search:

    def __init__(self):
        # Robot has no access to Selen...so we have to use this to be able to access webelements in python
        self.selen_lib = BuiltIn().get_library_instance("SeleniumLibrary")


    @keyword
    def search_topics_and_save_to_watchlist(self, topic_list):
        # iterates through every item in given list...searches for it...then saves the article for later
        for topic in topic_list:
            self.selen_lib.input_text("css:#searchInput", topic)
            self.selen_lib.wait_until_page_contains_element("xpath://form[@id='searchform']/div/button")
            self.selen_lib.click_button("xpath://form[@id='searchform']/div/button")
            self.selen_lib.wait_until_page_contains_element("xpath://ul/li[@id='ca-watch']/a")
            self.selen_lib.click_link("xpath://ul/li[@id='ca-watch']/a")
