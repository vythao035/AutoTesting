import calendar
import random
import string
import time
import os
import unittest

import selenium.common.exceptions
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver import ActionChains
from selenium.webdriver.support.ui import Select, WebDriverWait
from selenium.webdriver.support import expected_conditions

import warnings

warnings.simplefilter("ignore", ResourceWarning)


class TestingHome(unittest.TestCase):
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

    ## TODO: check map focus on VietNam
    # def test_map_context(self):
    #     """
    #     kiem tra ban do zoom vao dat nuoc Viet Nam
    #     :return:
    #     """

    # def test_zoom_in_map_using_button(self):
    #     """
    #     click zoom in button -> zoom level thay doi
    #     :return:
    #     """
    #     driver = self.driver
    #     zoom_level_element = driver.find_element(By.CSS_SELECTOR, '.leaflet-proxy')
    #     curent_zoom_level = zoom_level_element.get_property('scale')
    #     print(zoom_level_element.location_once_scrolled_into_view)
    #     zoom_in_button = driver.find_element(By.CSS_SELECTOR, '.leaflet-control-zoom-in')
    #     zoom_in_button.click()

    def test_choose_valid_day(self):
        driver = self.driver
        start_time = '12/12/2022'
        end_time = '20/12/2022'
        select_time_element = driver.find_element(By.CSS_SELECTOR, '.ant-picker')
        select_time_element.click()

        start_year = start_time.split('/')[2]
        start_month = start_time.split('/')[1]
        start_day = start_time.split('/')[0]

        end_year = end_time.split('/')[2]
        end_month = end_time.split('/')[1]
        end_day = end_time.split('/')[0]

        start_year_element = driver.find_element(By.CSS_SELECTOR, 'div.ant-picker-panel:nth-child(1) > '
                                                                  'div:nth-child(1) > div:nth-child(1) > '
                                                                  'div:nth-child(3) > button:nth-child(2)')
        act = ActionChains(driver)
        if start_year != start_year_element.text:
            act.move_to_element(start_year_element).click(start_year_element).perform()
            choose_year_field = driver.find_elements(By.XPATH,
                                                     '/html/body/div[2]/div/div/div/div[2]/div/div/div/div[2]/table/tbody/tr/td')
            for year in choose_year_field:
                if year.text == start_year:
                    year.click()
                    break

        start_month_element = driver.find_element(By.CSS_SELECTOR, 'div.ant-picker-panel:nth-child(1) > '
                                                                   'div:nth-child(1) > div:nth-child(1) > '
                                                                   'div:nth-child(3) > button:nth-child(1)')
        if calendar.month_abbr[int(start_month)] != start_month_element.text:
            act.move_to_element(start_month_element).click(start_month_element).perform()
            choose_month_field = driver.find_elements(By.XPATH,
                                                      '/html/body/div[2]/div/div/div/div[2]/div/div/div/div[2]/table/tbody/tr/td')
            for month in choose_month_field:
                if calendar.month_abbr[int(start_month)] == month:
                    month.click()
                    break

        choose_day_field = driver.find_elements(By.XPATH,
                                                '/html/body/div[2]/div/div/div/div[2]/div/div/div/div[2]/table/tbody/tr/td')
        for date in choose_day_field:
            if date.text == start_day:
                date.click()
                break

        print(select_time_element.text)

        time.sleep(5)

        # end_year_element = driver.find_element(By.CSS_SELECTOR, 'div.ant-picker-panel:nth-child(2) > '
        #                                                         'div:nth-child(1) > div:nth-child(1) > '
        #                                                         'div:nth-child(3) > button:nth-child(2)')
        #
        # if end_year != end_year_element.text:
        #     act.move_to_element(end_year_element).click(end_year_element).perform()
        #     choose_year_field = driver.find_elements(By.XPATH,
        #                                              '/html/body/div[2]/div/div/div/div[2]/div/div/div/div[2]/table/tbody/tr/td')
        #     for year in choose_year_field:
        #         if year.text == end_year:
        #             year.click()
        #             break
        #
        # end_month_element = driver.find_element(By.CSS_SELECTOR, 'div.ant-picker-panel:nth-child(1) > '
        #                                                            'div:nth-child(1) > div:nth-child(1) > '
        #                                                            'div:nth-child(3) > button:nth-child(1)')
        #
        # if calendar.month_abbr[int(end_month)] != end_month_element.text:
        #     act.move_to_element(end_month_element).click(end_month_element).perform()
        #     choose_month_field = driver.find_elements(By.XPATH,
        #                                               '/html/body/div[2]/div/div/div/div[2]/div/div/div/div[2]/table/tbody/tr/td')
        #     for month in choose_month_field:
        #         if calendar.month_abbr[int(end_month)] == month:
        #             month.click()
        #             break
        #
        # choose_day_field = driver.find_elements(By.XPATH,
        #                                         '/html/body/div[2]/div/div/div/div[2]/div/div/div/div[2]/table/tbody/tr/td')
        # for date in choose_day_field:
        #     if date.text == end_day:
        #         date.click()
        #         break

        time.sleep(3)

    def test_start_time_has_same_current_month_and_year(self):
        driver = self.driver
        start_time = '12/12/2022'
        end_time = '13/12/2022'
        select_time_element = driver.find_element(By.CSS_SELECTOR, '.ant-picker')
        select_time_element.click()

        start_year = start_time.split('/')[2]
        start_month = start_time.split('/')[1]
        start_day = start_time.split('/')[0]

        end_year = end_time.split('/')[2]
        end_month = end_time.split('/')[1]
        end_day = end_time.split('/')[0]

        start_year_element = driver.find_element(By.CSS_SELECTOR, 'div.ant-picker-panel:nth-child(1) > '
                                                                  'div:nth-child(1) > div:nth-child(1) > '
                                                                  'div:nth-child(3) > button:nth-child(2)')

        start_month_element = driver.find_element(By.CSS_SELECTOR, 'div.ant-picker-panel:nth-child(1) > '
                                                                   'div:nth-child(1) > div:nth-child(1) > '
                                                                   'div:nth-child(3) > button:nth-child(1)')

        act = ActionChains(driver)
        if start_year == start_year_element.text and calendar.month_abbr[int(start_month)] == start_month_element.text:
            choose_day_field = driver.find_elements(By.XPATH,
                                                    '/html/body/div[2]/div/div/div/div[2]/div/div/div/div[2]/table/tbody/tr/td')
            for date in choose_day_field:
                if date.text == start_day:
                    date.click()
                    time.sleep(2)
                    break

            for date in choose_day_field:
                if date.text == end_day:
                    date.click()
                    time.sleep(2)
                    break

        act.move_to_element(select_time_element).perform()
        start_time_element = driver.find_element(By.ID, 'sideBar-date-picker')
        end_time_element = driver.find_element(By.CSS_SELECTOR,
                                               'div.ant-picker-input:nth-child(3) > input:nth-child(1)')

        self.assertEqual(start_time_element.get_property('value'), start_time)
        self.assertEqual(end_time_element.get_property('value'), end_time)

    def test_date_has_same_current_year(self):
        driver = self.driver
        start_time = '12/10/2022'
        end_time = '15/10/2022'

        clear_current_time_element = driver.find_element(By.CSS_SELECTOR,
                                                         '.anticon-close-circle > svg:nth-child(1) > path:nth-child(1)')
        clear_current_time_element.click()

        select_time_element = driver.find_element(By.CSS_SELECTOR, '.ant-picker')
        select_time_element.click()

        start_year = start_time.split('/')[2]
        start_month = start_time.split('/')[1]
        start_day = start_time.split('/')[0]

        end_year = end_time.split('/')[2]
        end_month = end_time.split('/')[1]
        end_day = end_time.split('/')[0]

        start_year_element = driver.find_element(By.CSS_SELECTOR, 'div.ant-picker-panel:nth-child(1) > '
                                                                  'div:nth-child(1) > div:nth-child(1) > '
                                                                  'div:nth-child(3) > button:nth-child(2)')

        start_month_element = driver.find_element(By.CSS_SELECTOR, 'div.ant-picker-panel:nth-child(1) > '
                                                                   'div:nth-child(1) > div:nth-child(1) > '
                                                                   'div:nth-child(3) > button:nth-child(1)')

        act = ActionChains(driver)
        if start_year == start_year_element.text and start_month_element.text != calendar.month_abbr[int(start_month)]:
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
                    # act.move_to_element(date).click().perform()
                    date.click()
                    time.sleep(2)
                    break

        if end_year == start_year and end_month == start_month:
            choose_day_field = driver.find_elements(By.XPATH,
                                                    '/html/body/div[2]/div/div/div/div[2]/div/div/div/div[2]/table/tbody/tr/td')
            for date in choose_day_field:
                if date.text == end_day:
                    date.click()
                    time.sleep(2)
                    break

        act.move_to_element(select_time_element).perform()
        start_time_element = driver.find_element(By.ID, 'sideBar-date-picker')
        end_time_element = driver.find_element(By.CSS_SELECTOR,
                                               'div.ant-picker-input:nth-child(3) > input:nth-child(1)')

        self.assertEqual(start_time_element.get_property('value'), start_time)
        self.assertEqual(end_time_element.get_property('value'), end_time)

    def test_time_not_same_current_month_year(self):
        driver = self.driver
        start_time = '12/05/2021'
        end_time = '15/07/2021'

        clear_current_time_element = driver.find_element(By.CSS_SELECTOR,
                                                         '.anticon-close-circle > svg:nth-child(1) > path:nth-child(1)')
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
                # act.move_to_element(date).click().perform()
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
                date.click()
                time.sleep(2)
                break

    def test_time_not_same_current_month_year_1(self):
        driver = self.driver
        start_time = '12/05/2021'
        end_time = '15/07/2022'

        clear_current_time_element = driver.find_element(By.CSS_SELECTOR,
                                                         '.anticon-close-circle > svg:nth-child(1) > path:nth-child(1)')
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

    def test_choose_user(self):
        driver = self.driver
        select_user_button = driver.find_element(By.XPATH, '/html/body/div[1]/div/section/div/div/div[1]/div/div[2]/div/span[1]')
        select_user_button.click()

        act = ActionChains(driver)
        user_table_element = driver.find_element(By.XPATH, '/html/body/div[2]/div/div/div/div[2]/div[1]')
        user_name = 'cant2'
        found_user = False
        
        while True:
            search_options = user_table_element.find_elements(By.CLASS_NAME, 'ant-select-item-option-content')

            def get_attr(item_option):
                return item_option.text

            # time.sleep(2)
            for item_option in search_options:
                title = get_attr(item_option)
                if title == user_name:
                    found_user = True
                    item_option.click()
                    time.sleep(2)
                    break
            if not found_user:
                driver.execute_script('arguments[0].scrollTop = arguments[0].scrollTop + arguments[0].offsetHeight;',
                                  user_table_element)
                WebDriverWait(driver, 10).until(expected_conditions.staleness_of(search_options[0]))
            else:
                break

        check_box_users = driver.find_elements(By.CLASS_NAME, 'ant-checkbox-wrapper-checked')
        for check_box in check_box_users:
            box = check_box.find_element(By.CLASS_NAME, 'ant-checkbox-checked')
            if check_box.text == user_name:
                is_selected_checkbox = True
        self.assertTrue(is_selected_checkbox)

    def test_send_keys_user_name(self):
        driver = self.driver

        user_name = 'haicx'
        select_user_button = driver.find_element(By.XPATH, '//*[@id="rc_select_0"]')
        select_user_button.send_keys(user_name)
        select_user_button.send_keys(Keys.ENTER)

        is_selected_checkbox = False
        check_box_users = driver.find_elements(By.CLASS_NAME, 'ant-checkbox-wrapper-checked')
        for check_box in check_box_users:
            box = check_box.find_element(By.CLASS_NAME, 'ant-checkbox-checked')
            if check_box.text == user_name:
                is_selected_checkbox = True

        self.assertTrue(is_selected_checkbox)

    def test_choose_number_username_per_page(self):
        driver = self.driver
        select_elemenet = driver.find_element(By.CSS_SELECTOR, '.ant-select-sm > div:nth-child(1) > span:nth-child(2)')
        select_elemenet.click()

        numbers_user_per_page = 10
        user_per_page = f"{numbers_user_per_page} / page"

        act = ActionChains(driver)
        options = driver.find_elements(By.CLASS_NAME, 'ant-select-item-option')
        for option in options:
            # print(option.text)
            if option.text == user_per_page:
                print(option.text)
                act.move_to_element(option).click().perform()
                # option.click()

        users_table = driver.find_elements(By.XPATH, '/html/body/div/div/section/div/div/div[1]/div/div[3]/div/div')
        self.assertEqual(numbers_user_per_page, len(users_table))
        time.sleep(5)

    def test_click_next_page(self):
        driver = self.driver

        select_page_field = driver.find_element(By.XPATH, '/html/body/div/div/section/div/div/div[1]/div/div[4]/ul')
        page_fields = select_page_field.find_elements(By.CLASS_NAME, 'ant-pagination-item')
        current_page = select_page_field.find_element(By.CLASS_NAME, 'ant-pagination-item-active')

        next_page_button = driver.find_element(By.CSS_SELECTOR, 'li.ant-pagination-next:nth-child(9) >'
                                                                ' button:nth-child(1)')
        next_page_button.click()
        next_page = select_page_field.find_element(By.CLASS_NAME, 'ant-pagination-item-active')

        self.assertEqual(int(current_page.text) + 1, int(next_page.text))

    def test_click_next_page_1(self):
        driver = self.driver
        select_page_field = driver.find_element(By.XPATH, '/html/body/div/div/section/div/div/div[1]/div/div[4]/ul')
        current_page = select_page_field.find_element(By.CLASS_NAME, 'ant-pagination-item-active')

        next_page_button = driver.find_element(By.CSS_SELECTOR, 'li.ant-pagination-next:nth-child(9) >'
                                                                ' button:nth-child(1)')
        for i in range(5):
            next_page_button.click()
            next_page = select_page_field.find_element(By.CLASS_NAME, 'ant-pagination-item-active')
            self.assertEqual(int(current_page.text) + 1, int(next_page.text))

        self.assertEqual(int(current_page.text) + 5, int(next_page.text))

    def test_not_choose_all_user(self):
        driver = self.driver
        select_all_users_checkbox = driver.find_element(By.XPATH, '/html/body/div/div/section/div/div/div[1]/div/div[3]/label')

        number_users = int(select_all_users_checkbox.text.split('(')[1].replace(')', ''))
        time.sleep(2)
        select_all_users_checkbox.click()
        time.sleep(2)
        selected_checkbox_user = driver.find_elements(By.CLASS_NAME, 'ant-checkbox-wrapper-checked')
        print(len(selected_checkbox_user))

        self.assertNotEqual(len(selected_checkbox_user) - 1, number_users)

    def test_choose_all_user(self):
        driver = self.driver
        select_all_users_checkbox = driver.find_element(By.XPATH, '/html/body/div/div/section/div/div/div[1]/div/div[3]/label')

        number_users = int(select_all_users_checkbox.text.split('(')[1].replace(')', ''))
        time.sleep(2)
        # select_all_users_checkbox.click()
        # time.sleep(2)
        selected_checkbox_user = driver.find_elements(By.CLASS_NAME, 'ant-checkbox-wrapper-checked')
        print(len(selected_checkbox_user))

        self.assertNotEqual(len(selected_checkbox_user) - 1, number_users)

    def tearDown(self):
        self.driver.close()


if __name__ == '__main__':
    unittest.main()


