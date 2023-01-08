import time
import unittest
import calendar
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver import ActionChains
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions


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

        # choose time
        start_time = '12/12/2021'
        end_time = '24/12/2021'
        pick_time(driver, start_time, end_time)

        self.act = ActionChains(driver)
        act = self.act

        # search
        search_button = driver.find_element(By.CLASS_NAME, 'anticon-search')
        act.move_to_element(search_button).click().perform()


    def test_num_cols_rows_in_trips_table(self):
        driver = self.driver
        traffic_sign_table_element = driver.find_element(By.CLASS_NAME, 'ant-table-container')
        cols = traffic_sign_table_element.find_elements(By.XPATH, '/html/body/div[1]/div/section/div/div/div[2]/div[2]/div[1]/div/div/div/div/div[1]/table/thead/tr/th')
        rows = traffic_sign_table_element.find_elements(By.CLASS_NAME, 'ant-table-row')

        num_col = len(cols)
        num_row = len(rows)
        self.assertEqual(num_col, 8)
        self.assertEqual(num_row, 3)

    def test_consistency_users_in_trip_table(self):
        driver = self.driver

        users = []
        next_page_button = driver.find_element(By.XPATH, '/html/body/div[1]/div/section/div/div/div[2]/div[2]/div[2]/ul/li[9]')
        while next_page_button.get_attribute("aria-disabled") != 'true':
            traffic_sign_table_element = driver.find_element(By.CLASS_NAME, 'ant-table-container')
            cols = traffic_sign_table_element.find_elements(By.XPATH,
                                                            '/html/body/div[1]/div/section/div/div/div[2]/div[2]/div[1]/div/div/div/div/div[1]/table/thead/tr/th')
            rows = traffic_sign_table_element.find_elements(By.CLASS_NAME, 'ant-table-row')
            for c_idx, col in enumerate(cols):
                if col.text == "Tài khoản":
                    for r_idx, row in enumerate(rows):
                        path = f"/html/body/div[1]/div/section/div/div/div[2]/div[2]/div[1]/div/div/div/div/div[2]/table/tbody/tr[{r_idx + 2}]/td[{c_idx + 1}]"
                        cell_element = traffic_sign_table_element.find_element(By.XPATH, path)
                        user_name = cell_element.text
                        if user_name not in users:
                            users.append(user_name)

            next_page_button.click()
            time.sleep(1)

        next_group_button = driver.find_element(By.XPATH, '/html/body/div[1]/div/section/div/div/div[1]/div/div[4]/ul/li[9]')
        num_users_selected = 0
        while next_group_button.get_attribute("aria-disabled") != 'true':
            check_box_user_group = driver.find_element(By.XPATH, '/html/body/div[1]/div/section/div/div/div[1]/div/div[3]/div')
            check_box_users = check_box_user_group.find_elements(By.CLASS_NAME, 'ant-checkbox-checked')
            num_users_selected += len(check_box_users)
            next_group_button.click()

        print(num_users_selected)
        print(len(users))
        self.assertEqual(num_users_selected, len(users))

    def test_consistency_when_select_user(self):
        driver = self.driver

        name = 'viettd2'
        select_user_button = driver.find_element(By.XPATH, '//*[@id="rc_select_0"]')
        select_user_button.send_keys(name)
        select_user_button.send_keys(Keys.ENTER)

        users = []
        traffic_sign_table_element = driver.find_element(By.CLASS_NAME, 'ant-table-container')
        cols = traffic_sign_table_element.find_elements(By.XPATH,
                                                        '/html/body/div[1]/div/section/div/div/div[2]/div[2]/div[1]/div/div/div/div/div[1]/table/thead/tr/th')
        rows = traffic_sign_table_element.find_elements(By.CLASS_NAME, 'ant-table-row')
        for c_idx, col in enumerate(cols):
            if col.text == "Tài khoản":
                for r_idx, row in enumerate(rows):
                    path = f"/html/body/div[1]/div/section/div/div/div[2]/div[2]/div[1]/div/div/div/div/div[2]/table/tbody/tr[{r_idx + 2}]/td[{c_idx + 1}]"
                    cell_element = traffic_sign_table_element.find_element(By.XPATH, path)
                    user_name = cell_element.text
                    if user_name not in users:
                        users.append(user_name)

        self.assertEqual(users[0], name)
        self.assertTrue(len(users) == 1)

    def test_consistency_num_trips(self):
        driver = self.driver
        driver = self.driver

        name = 'viettd2'
        select_user_button = driver.find_element(By.XPATH, '//*[@id="rc_select_0"]')
        select_user_button.send_keys(name)
        select_user_button.send_keys(Keys.ENTER)

        users = []
        traffic_sign_table_element = driver.find_element(By.CLASS_NAME, 'ant-table-container')
        cols = traffic_sign_table_element.find_elements(By.XPATH,
                                                        '/html/body/div[1]/div/section/div/div/div[2]/div[2]/div[1]/div/div/div/div/div[1]/table/thead/tr/th')
        rows = traffic_sign_table_element.find_elements(By.CLASS_NAME, 'ant-table-row')

        num_trips = len(rows)
        text = f"Danh sách hành trình ({num_trips} hành trình)"

        title_trip_list = driver.find_element(By.XPATH, '/html/body/div[1]/div/section/div/div/div[2]/p')
        print(title_trip_list.text)

        self.assertEqual(text, title_trip_list.text)

    def test_trip_is_displayed_in_map(self):
        driver = self.driver

        # show_trip_in_map_checkbox = driver.find_element(By.XPATH, '/html/body/div[1]/div/section/div/div/div[2]/div[4]')
        # selected_show_trip_in_map = driver.find_element(By.CLASS_NAME, 'ant-checkbox-checked')
        # print(selected_show_trip_in_map.is_displayed())


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
            driver.execute_script(
                'arguments[0].scrollTop = arguments[0].scrollTop + arguments[0].offsetHeight;',
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
            date.click()
            time.sleep(2)
            break


if __name__ == '__main__':
    unittest.main()
