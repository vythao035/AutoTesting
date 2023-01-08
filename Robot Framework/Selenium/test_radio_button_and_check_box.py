import time
import unittest
import calendar
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver import ActionChains
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions


class TestRadiobutton(unittest.TestCase):
    def setUp(self):
        self.driver = webdriver.Firefox()
        driver = self.driver
        driver.implicitly_wait(5)
        driver.maximize_window()
        driver.get('https://demo.guru99.com/test/radio.html')

    def test_select_radio_button(self):
        driver = self.driver
        button_1 = driver.find_element(By.ID, 'vfb-7-1')
        button_2 = driver.find_element(By.ID, 'vfb-7-2')
        button_1.click()
        time.sleep(5)
        self.assertTrue(button_1.is_selected())
        self.assertFalse(button_2.is_selected())

    def test_select_checkbox(self):
        driver = self.driver
        checkbox_1 = driver.find_element(By.ID, 'vfb-6-1')
        checkbox_2 = driver.find_element(By.ID, 'vfb-6-2')
        checkbox_1.click()
        time.sleep(5)
        self.assertTrue(checkbox_1.is_selected())
        self.assertFalse(checkbox_2.is_selected())

    def tearDown(self):
        self.driver.close()


class TestClickImage(unittest.TestCase):
    def setUp(self):
        self.driver = webdriver.Firefox()
        driver = self.driver
        driver.implicitly_wait(5)
        driver.maximize_window()
        driver.get('https://demo.guru99.com/test/radio.html')

    def test_click_img(self):
        driver = self.driver
        current_title = driver.title
        img = driver.find_element(By.CSS_SELECTOR, '.top-banner > table:nth-child(1) >'
                                                   ' tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(1) >'
                                                   ' a:nth-child(1) > img:nth-child(1)')
        img.click()
        time.sleep(5)
        self.assertNotEqual(current_title, driver.title)

    def test_right_click(self):
        driver = self.driver
        act = ActionChains(driver)
        img = driver.find_element(By.CSS_SELECTOR, '.top-banner > table:nth-child(1) >'
                                                   ' tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(1) >'
                                                   ' a:nth-child(1) > img:nth-child(1)')
        # act.context_click(img).send_keys(Keys.ARROW_DOWN).send_keys(Keys.RETURN).perform()
        act.context_click(img).send_keys(Keys.DOWN).send_keys(Keys.RETURN).perform()

        time.sleep(2)

    def tearDown(self):
        self.driver.close()


class TestKeysAction(unittest.TestCase):
    def setUp(self):
        self.driver = webdriver.Firefox()
        driver = self.driver
        driver.implicitly_wait(5)
        driver.maximize_window()
        driver.get('https://stackoverflow.com/questions/36155113/python-selenium-press-down-arrow-to-dispay-all-page-contents')

    def test_right_click_1(self):
        driver = self.driver
        act = ActionChains(driver)
        img = driver.find_element(By.CSS_SELECTOR, '.top-banner > table:nth-child(1) >'
                                                   ' tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(1) >'
                                                   ' a:nth-child(1) > img:nth-child(1)')

        for _ in range(3):
            act.send_keys(Keys.PAGE_DOWN).perform()
            time.sleep(2)

    def tearDown(self):
        self.driver.close()


class TestDragDropAction(unittest.TestCase):
    def setUp(self):
        self.driver = webdriver.Firefox()
        driver = self.driver
        driver.implicitly_wait(5)
        driver.maximize_window()
        driver.get('https://jqueryui.com/resources/demos/droppable/default.html')

    def test_drag_drop(self):
        driver = self.driver
        act = ActionChains(driver)
        source_element = driver.find_element(By.CSS_SELECTOR, "#draggable")
        target_element = driver.find_element(By.CSS_SELECTOR, '#droppable')
        act.drag_and_drop(source_element, target_element)
        act.perform()
        time.sleep(4)

    def tearDown(self):
        self.driver.close()


class TestAlert(unittest.TestCase):
    def setUp(self):
        self.driver = webdriver.Firefox()
        driver = self.driver
        driver.implicitly_wait(5)
        driver.maximize_window()
        driver.get('http://demo.guru99.com/test/delete_customer.php')

    def test_alert(self):
        driver = self.driver
        customer_id_field = driver.find_element(By.NAME, 'cusid')
        customer_id_field.send_keys('12567')

        submit_button = driver.find_element(By.NAME, 'submit')
        submit_button.click()

        alert = driver.switch_to.alert
        print(alert.text)
        time.sleep(5)

        self.assertEqual(alert.text, 'Do you really want to delete this Customer?')

        alert.accept()

    def tearDown(self):
        self.driver.close()


class TestPopUp(unittest.TestCase):
    def setUp(self):
        self.driver = webdriver.Firefox()
        driver = self.driver
        driver.implicitly_wait(5)
        driver.maximize_window()
        driver.get('http://demo.guru99.com/popup.php')

    def test_popup(self):
        driver = self.driver
        element = driver.find_element(By.CSS_SELECTOR, 'body > p:nth-child(7) > a:nth-child(1)')
        element.click()

        current_window = driver.current_window_handle
        for w in driver.window_handles:
            if w != current_window:
                popup_window = w

        driver.switch_to.window(popup_window)
        mail_id_element = driver.find_element(By.NAME, 'emailid')
        mail_id_element.send_keys('thaontv@gmail.com')

        login_button = driver.find_element(By.NAME, 'btnLogin')
        login_button.click()

        access_email_field = driver.find_element(By.XPATH, '/html/body/table/tbody/tr[6]/td/h3')
        print(access_email_field.text)
        self.assertEqual(access_email_field.text, 'This access is valid only for 20 days.')
        driver.switch_to.window(current_window)

    def tearDown(self):
        self.driver.close()


class TestStaticWebTable(unittest.TestCase):
    def setUp(self):
        self.driver = webdriver.Firefox()
        driver = self.driver
        driver.implicitly_wait(5)
        driver.maximize_window()
        driver.get('http://demo.guru99.com/test/write-xpath-table.html')

    def test_static_web_table(self):
        driver = self.driver
        table = driver.find_elements(By.XPATH, '/html/body/center/table/tbody/tr/td')

        for cell in table:
            print(cell.text)

    ## Giong pick date

    def tearDown(self):
        self.driver.close()


class TestDynamicWebTable(unittest.TestCase):
    def setUp(self):
        self.driver = webdriver.Firefox()
        driver = self.driver
        driver.implicitly_wait(5)
        driver.maximize_window()
        driver.get('http://171.244.173.203/xsign-admin')

        user_name = driver.find_element(By.ID, 'basic_username')
        passwd = driver.find_element(By.ID, 'basic_password')
        login_button = driver.find_element(By.CSS_SELECTOR, '.ant-btn')

        user_name.send_keys('hni_manager')
        passwd.send_keys('Xsign@HNI2021')
        login_button.click()

    def test_dynamic_web_table_in_specific_province(self):
        driver = self.driver
        signs_statistic = driver.find_element(By.CSS_SELECTOR, 'li.ant-menu-overflow-item:nth-child(3)')
        signs_statistic.click()

        # choose time
        start_time = '12/12/2021'
        end_time = '24/12/2021'
        pick_time(driver, start_time, end_time)

        province_name = 'Ha Noi'
        user_name = 'linhnm9'
        trip_name = 'linhnm9 - Hành trình số 1'

        act = ActionChains(driver)

        # choose_province
        province_element = driver.find_element(By.XPATH,
                                               '/html/body/div[1]/div/section/div/div/div[1]/div[1]/div[3]/div')
        province_element.click()

        province_table = driver.find_element(By.XPATH, '/html/body/div[3]/div/div/div/div[2]')
        provinces = province_table.find_elements(By.CLASS_NAME, 'ant-select-item-option-content')
        for province in provinces:
            if province.text == province_name:
                act.move_to_element(province).click().perform()

        self.assertEqual(province_element.text, province_name)

        # choose user
        user_element = driver.find_element(By.XPATH,
                                           '/html/body/div[1]/div/section/div/div/div[1]/div[1]/div[5]/div')

        user_element.click()
        user_table = driver.find_element(By.XPATH, '/html/body/div[4]/div/div/div/div[2]')
        found_user = False

        while True:
            search_options = user_table.find_elements(By.CLASS_NAME, 'ant-select-item-option-content')

            def get_attr(item_option):
                return item_option.text

            for item_option in search_options:
                title = get_attr(item_option)
                if title == user_name:
                    found_user = True
                    act.move_to_element(item_option).click().perform()
                    time.sleep(2)
                    break
            if not found_user:
                driver.execute_script('arguments[0].scrollTop = arguments[0].scrollTop + arguments[0].offsetHeight;',
                                      user_table)
                WebDriverWait(driver, 10).until(expected_conditions.staleness_of(search_options[0]))
            else:
                break

        self.assertEqual(user_element.text, user_name)

        # choose_trip
        trip_element = driver.find_element(By.XPATH,
                                           '/html/body/div[1]/div/section/div/div/div[1]/div[1]/div[7]/div')
        trip_element.click()
        trip_table = driver.find_element(By.XPATH, '/html/body/div[5]/div/div/div/div[2]')

        found_trip = False

        while True:
            search_options = trip_table.find_elements(By.CLASS_NAME, 'ant-select-item-option-content')

            def get_attr(item_option):
                return item_option.text

            for item_option in search_options:
                title = get_attr(item_option)
                if title == trip_name:
                    found_trip = True
                    act.move_to_element(item_option).click().perform()
                    time.sleep(2)
                    break
            if not found_trip:
                driver.execute_script('arguments[0].scrollTop = arguments[0].scrollTop + arguments[0].offsetHeight;',
                                      trip_table)
                WebDriverWait(driver, 10).until(expected_conditions.staleness_of(search_options[0]))
            else:
                break
        time.sleep(2)
        self.assertEqual(trip_element.text, trip_name)

    def test_dynamic_web_table_num_row_col_in_table(self):
        driver = self.driver
        signs_statistic = driver.find_element(By.CSS_SELECTOR, 'li.ant-menu-overflow-item:nth-child(3)')
        signs_statistic.click()

        selected_item_menu = driver.find_element(By.CLASS_NAME, 'ant-menu-item-selected')
        print(selected_item_menu.text)

        # choose time
        start_time = '12/12/2021'
        end_time = '24/12/2021'
        pick_time(driver, start_time, end_time)

        province_name = 'Ha Noi'
        user_name = 'linhnm9'
        trip_name = 'linhnm9 - Hành trình số 1'

        act = ActionChains(driver)

        # choose_province
        province_element = driver.find_element(By.XPATH,
                                               '/html/body/div[1]/div/section/div/div/div[1]/div[1]/div[3]/div')
        province_element.click()

        province_table = driver.find_element(By.XPATH, '/html/body/div[3]/div/div/div/div[2]')
        scroll_and_select_item(driver, province_name, province_table, act)

        self.assertEqual(province_element.text, province_name)

        # choose user
        user_element = driver.find_element(By.XPATH,
                                           '/html/body/div[1]/div/section/div/div/div[1]/div[1]/div[5]/div')

        user_element.click()
        user_table = driver.find_element(By.XPATH, '/html/body/div[4]/div/div/div/div[2]')
        scroll_and_select_item(driver, user_name, user_table, act)

        self.assertEqual(user_element.text, user_name)

        # choose_trip
        trip_element = driver.find_element(By.XPATH,
                                           '/html/body/div[1]/div/section/div/div/div[1]/div[1]/div[7]/div')
        trip_element.click()
        trip_table = driver.find_element(By.XPATH, '/html/body/div[5]/div/div/div/div[2]')
        scroll_and_select_item(driver, trip_name, trip_table, act)

        self.assertEqual(trip_element.text, trip_name)

        # search
        search_button = driver.find_element(By.XPATH, '/html/body/div[1]/div/section/div/div/div[1]/div[1]/div[8]/button')
        act.move_to_element(search_button).click().perform()

        time.sleep(2)

        traffic_sign_table_element = driver.find_element(By.XPATH, '/html/body/div[1]/div/section/div/div/div[1]/div[4]/div/div/div/div/div[1]/table')

        cols = traffic_sign_table_element.find_elements(By.XPATH, '/html/body/div[1]/div/section/div/div/div[1]/div[4]/div/div/div/div/div[1]/table/thead/tr/th')
        rows = traffic_sign_table_element.find_elements(By.XPATH, '/html/body/div[1]/div/section/div/div/div[1]/div[4]/div/div/div/div/div[2]/table/tbody/tr')

        num_col = len(cols)
        num_row = len(rows)
        self.assertEqual(num_col, 10)
        self.assertEqual(num_row, 3)

    def test_navigation_bar(self):
        driver = self.driver

        """default selected item menu"""

        selected_item_menu = driver.find_element(By.CLASS_NAME, 'ant-menu-item-selected')
        tmp = selected_item_menu.text

        # if len(tmp) > 0:
        print("tmp: ", tmp.encode("utf-8"))
        print("tmp ", tmp)
        self.assertEqual("Thống kê hành trình", tmp)

    def test_dynamic_web_table_valid_value_in_columns(self):
        driver = self.driver
        signs_statistic = driver.find_element(By.CSS_SELECTOR, 'li.ant-menu-overflow-item:nth-child(3)')
        signs_statistic.click()

        selected_item_menu = driver.find_element(By.CLASS_NAME, 'ant-menu-item-selected')
        print(selected_item_menu.text)

        # choose time
        start_time = '12/12/2021'
        end_time = '24/12/2021'
        pick_time(driver, start_time, end_time)

        province_name = 'Ha Noi'
        user_name = 'linhnm9'
        trip_name = 'linhnm9 - Hành trình số 1'

        act = ActionChains(driver)

        # choose_province
        province_element = driver.find_element(By.XPATH,
                                               '/html/body/div[1]/div/section/div/div/div[1]/div[1]/div[3]/div')
        province_element.click()

        province_table = driver.find_element(By.XPATH, '/html/body/div[3]/div/div/div/div[2]')
        scroll_and_select_item(driver, province_name, province_table, act)

        self.assertEqual(province_element.text, province_name)

        # choose user
        user_element = driver.find_element(By.XPATH,
                                           '/html/body/div[1]/div/section/div/div/div[1]/div[1]/div[5]/div')

        user_element.click()
        user_table = driver.find_element(By.XPATH, '/html/body/div[4]/div/div/div/div[2]')
        scroll_and_select_item(driver, user_name, user_table, act)

        self.assertEqual(user_element.text, user_name)

        # choose_trip
        trip_element = driver.find_element(By.XPATH,
                                           '/html/body/div[1]/div/section/div/div/div[1]/div[1]/div[7]/div')
        trip_element.click()
        trip_table = driver.find_element(By.XPATH, '/html/body/div[5]/div/div/div/div[2]')
        scroll_and_select_item(driver, trip_name, trip_table, act)

        self.assertEqual(trip_element.text, trip_name)

        # search
        search_button = driver.find_element(By.XPATH, '/html/body/div[1]/div/section/div/div/div[1]/div[1]/div[8]/button')
        act.move_to_element(search_button).click().perform()

        time.sleep(2)

        traffic_sign_table_element = driver.find_element(By.XPATH, '/html/body/div[1]/div/section/div/div/div[1]/div[4]/div/div/div/div/div[1]/table')

        cols = traffic_sign_table_element.find_elements(By.XPATH, '/html/body/div[1]/div/section/div/div/div[1]/div[4]/div/div/div/div/div[1]/table/thead/tr/th')
        rows = traffic_sign_table_element.find_elements(By.XPATH, '/html/body/div[1]/div/section/div/div/div[1]/div[4]/div/div/div/div/div[2]/table/tbody/tr')

        traffic_sign_table_element.find_element(By.XPATH, '/html/body/div[1]/div/section/div/div/div[1]/div[4]/div/div/div/div/div[2]/table/tbody/tr[2]/td[1]')
        for c_idx, col in enumerate(cols):
            for r_idx, row in enumerate(rows[1:]):
                path = f"/html/body/div[1]/div/section/div/div/div[1]/div[4]/div/div/div/div/div[2]/table/tbody/tr[{r_idx + 2}]/td[{c_idx + 1}]"
                cell_element = traffic_sign_table_element.find_element(By.XPATH, path)
                if col.text == "Kinh độ":
                    self.assertTrue(-90 < float(cell_element.text) < 90)
                elif col.text == "Vĩ độ":
                    self.assertTrue(-180 < float(cell_element.text) < 180)
                elif col.text == "Azimuth":
                    self.assertTrue(0 <= float(cell_element.text) <= 360)
                elif col.text in ["Thời gian thu thập", "Tên biển", "Trạng thái"]:
                    self.assertIsNotNone(cell_element.text)

    def tearDown(self):
        self.driver.close()


def scroll_and_select_item(driver, item_name, table, act):
    found_item = False
    while True:
        search_options = table.find_elements(By.CLASS_NAME, 'ant-select-item-option-content')

        def get_attr(item_option):
            return item_option.text

        for item_option in search_options:
            title = get_attr(item_option)
            if title == item_name:
                found_item = True
                act.move_to_element(item_option).click().perform()
                time.sleep(2)
                break
        if not found_item:
            driver.execute_script('arguments[0].scrollTop = arguments[0].scrollTop + arguments[0].offsetHeight;',
                                  table)
            WebDriverWait(driver, 10).until(expected_conditions.staleness_of(search_options[0]))
        else:
            break


def pick_time(driver, start_time, end_time):
    clear_current_time_element = driver.find_element(By.CSS_SELECTOR,
                                                     '.anticon-close-circle > svg:nth-child(1)')
    clear_current_time_element.click()

    select_time_element = driver.find_element(By.CSS_SELECTOR, '.ant-picker')
    select_time_element.click()

    start_year = start_time.split('/')[2]
    start_month = start_time.split('/')[1]
    start_day = start_time.split('/')[0]

    end_year = end_time.split('/')[2]
    end_month = end_time.split('/')[1]
    end_day = end_time.split('/')[0]

    act = ActionChains(driver)
    start_year_element = driver.find_element(By.CSS_SELECTOR, 'div.ant-picker-panel:nth-child(1) > '
                                                              'div:nth-child(1) > div:nth-child(1) > '
                                                              'div:nth-child(3) > button:nth-child(2)')
    act.click(start_year_element).perform()
    choose_year_field = driver.find_elements(By.XPATH,
                                             '/html/body/div[2]/div/div/div/div[2]/div/div/div/div[2]/table/tbody/tr/td')
    for year in choose_year_field:
        if year.text == start_year:
            year.click()
            break

    start_month_element = driver.find_element(By.CSS_SELECTOR, 'div.ant-picker-panel:nth-child(1) > '
                                                               'div:nth-child(1) > div:nth-child(1) > '
                                                               'div:nth-child(3) > button:nth-child(1)')
    act.click(start_month_element).perform()
    choose_month_field = driver.find_elements(By.XPATH,
                                              '/html/body/div[2]/div/div/div/div[2]/div/div/div/div[2]/table/tbody/tr/td')
    for month in choose_month_field:
        if month.text == calendar.month_abbr[int(start_month)]:
            month.click()
            break

    choose_day_field = driver.find_elements(By.XPATH,
                                            '/html/body/div[2]/div/div/div/div[2]/div/div/div/div[2]/table/tbody/tr/td')
    for date in choose_day_field:
        if date.text == start_day:
            date.click()
            time.sleep(2)
            break

    end_year_element = driver.find_element(By.CSS_SELECTOR, 'div.ant-picker-panel:nth-child(2) > '
                                                            'div:nth-child(1) > div:nth-child(1) > '
                                                            'div:nth-child(3) > button:nth-child(2)')

    act.click(end_year_element).perform()
    choose_year_field = driver.find_elements(By.XPATH,
                                             '/html/body/div[2]/div/div/div/div[2]/div/div/div/div[2]/table/tbody/tr/td')
    for year in choose_year_field:
        if year.text == end_year:
            year.click()
            break

    choose_month_field = driver.find_elements(By.XPATH,
                                              '/html/body/div[2]/div/div/div/div[2]/div/div/div/div[2]/table/tbody/tr/td')
    for month in choose_month_field:
        if month.text == calendar.month_abbr[int(end_month)]:
            month.click()
            break

    choose_day_field = driver.find_elements(By.XPATH,
                                            '/html/body/div[2]/div/div/div/div[2]/div/div/div/div[2]/table/tbody/tr/td')
    for date in choose_day_field:
        if date.text == end_day:
            # act.move_to_element(date).click().perform()
            date.click()
            time.sleep(2)
            break


if __name__ == '__main__':
    unittest.main()
