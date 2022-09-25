from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class Shop:

    def __init__(self):
        self.slelib =  BuiltIn().get_library_instance("SeleniumLibrary")  #this function used to get any library into the python file

    @keyword
    def helloworld(self):
        print("hello boss")

    @keyword
    def add_items_to_cart_and_checkout(self,productList):
        i = 1
        # ${elements} =    Get WebElements   css:.card-title
        ProductsTitles =   self.slelib.get_webelements("css:.card-title")   #Get WebElements

        for Product in ProductsTitles:
            if  Product.text in productList:
                self.slelib.click_button("xpath:(//*[@class='card-footer'])["+str(i)+"]/button")

            i = i + 1