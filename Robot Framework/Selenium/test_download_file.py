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

        signs_statistic = driver.find_element(By.CSS_SELECTOR, 'li.ant-menu-overflow-item:nth-child(3)')
        signs_statistic.click()

        selected_item_menu = driver.find_element(By.CLASS_NAME, 'ant-menu-item-selected')

        # choose time
        start_time = '12/12/2021'
        end_time = '24/12/2021'
        pick_time(driver, start_time, end_time)

        province_name = 'Ha Noi'
        user_name = 'linhnm9'
        trip_name = 'linhnm9 - Hành trình số 1'

        self.act = ActionChains(driver)
        act = self.act

        # choose_province
        province_element = driver.find_element(By.XPATH,
                                               '/html/body/div[1]/div/section/div/div/div[1]/div[1]/div[3]/div')
        province_element.click()

        province_table = driver.find_element(By.XPATH, '/html/body/div[3]/div/div/div/div[2]')
        scroll_and_select_item(driver, province_name, province_table, act)

        # choose user
        user_element = driver.find_element(By.XPATH,
                                           '/html/body/div[1]/div/section/div/div/div[1]/div[1]/div[5]/div')

        user_element.click()
        user_table = driver.find_element(By.XPATH, '/html/body/div[4]/div/div/div/div[2]')
        scroll_and_select_item(driver, user_name, user_table, act)

        # choose_trip
        trip_element = driver.find_element(By.XPATH,
                                           '/html/body/div[1]/div/section/div/div/div[1]/div[1]/div[7]/div')
        trip_element.click()
        trip_table = driver.find_element(By.XPATH, '/html/body/div[5]/div/div/div/div[2]')
        scroll_and_select_item(driver, trip_name, trip_table, act)

        # search
        search_button = driver.find_element(By.XPATH, '/html/body/div[1]/div/section/div/div/div[1]/div[1]/div[8]/button')
        act.move_to_element(search_button).click().perform()


        self.traffic_sign_table_element = driver.find_element(By.XPATH, '/html/body/div[1]/div/section/div/div/div[1]/div[4]/div/div/div/div/div[1]/table')
        traffic_sign_table_element = self.traffic_sign_table_element

        self.cols = traffic_sign_table_element.find_elements(By.XPATH, '/html/body/div[1]/div/section/div/div/div[1]/div[4]/div/div/div/div/div[1]/table/thead/tr/th')

        self.rows = traffic_sign_table_element.find_elements(By.XPATH, '/html/body/div[1]/div/section/div/div/div[1]/div[4]/div/div/div/div/div[2]/table/tbody/tr')

    def test_download_collected_signs_file(self):
        driver = self.driver

        download_button = driver.find_element(By.CLASS_NAME, 'anticon-download')
        download_button.click()

        downloaded_files_button = driver.find_element()

        time.sleep(2)


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
            # act.move_to_element(date).click().perform()
            date.click()
            time.sleep(2)
            break


if __name__ == '__main__':
    unittest.main()
