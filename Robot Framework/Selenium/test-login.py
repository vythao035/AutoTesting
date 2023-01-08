import random
import string
import time
import os

import unittest

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver import ActionChains

import warnings

warnings.simplefilter("ignore", ResourceWarning)

class Login(unittest.TestCase):
    def setUp(self):
        self.driver = webdriver.Firefox()
        driver = self.driver
        driver.implicitly_wait(3)
        driver.maximize_window()
        driver.get('http://171.244.173.203/xsign-admin')

    def test_UI_login_screen(self):
        """
        has text box username
        has text box passwd
        has button visible passwd
        has button login
        :return:
        """
        driver = self.driver
        user_name = driver.find_element(By.ID, 'basic_username')
        passwd = driver.find_element(By.ID, 'basic_password')
        visible_pw = driver.find_element(By.CSS_SELECTOR, '.anticon-eye-invisible > svg:nth-child(1)')
        login_button = driver.find_element(By.CSS_SELECTOR, '.ant-btn')

        self.assertTrue(user_name.is_displayed()
                        and passwd.is_displayed()
                        and visible_pw.is_displayed()
                        and login_button.is_displayed())

    def test_UI_when_click_visible_pw(self):
        ## TODO: kiem tra hien thi pw khi nhan vao visible button
        """
        kiem tra hien thi pw khi nhan vao visible button
        :return:
        """
        driver = self.driver
        visible_pw = driver.find_element(By.CSS_SELECTOR, '.anticon-eye-invisible > svg:nth-child(1)')
        visible_pw.click()

        # print(visible_pw.get_property('aria-label'))
        # self.assertEqual(visible_pw.get_attribute('aria-label'), 'eye')

    def test_fill_user_name(self):
        """
        nhap username la chu, so, ky tu dac biet, dau cach
        :return:
        """
        driver = self.driver
        user_name = driver.find_element(By.ID, 'basic_username')
        user_name.send_keys("Thao @12$$")

        self.assertTrue(user_name.is_enabled())

    def test_login_with_lower_username(self):
        """
        nhap vao username la chu thuong
        pw hop le
        click login button
        :return: login thanh cong
        """
        driver = self.driver
        user_name = driver.find_element(By.ID, 'basic_username')
        passwd = driver.find_element(By.ID, 'basic_password')
        visible_pw = driver.find_element(By.CSS_SELECTOR, '.anticon-eye-invisible > svg:nth-child(1)')
        login_button = driver.find_element(By.CSS_SELECTOR, '.ant-btn')

        user_name.send_keys('hni_manager')
        passwd.send_keys('Xsign@HNI2021')
        login_button.click()

        user_acc_name = driver.find_element(By.CSS_SELECTOR, '.ant-dropdown-trigger > span:nth-child(2)')
        self.assertEqual(user_acc_name.text, 'hni_manager')

    def test_login_with_upper_username(self):
        """
        nhap vao username la chu hoa
        pw hop le
        click login button
        :return: login thanh cong
        :return:
        """
        driver = self.driver
        user_name = driver.find_element(By.ID, 'basic_username')
        passwd = driver.find_element(By.ID, 'basic_password')
        visible_pw = driver.find_element(By.CSS_SELECTOR, '.anticon-eye-invisible > svg:nth-child(1)')
        login_button = driver.find_element(By.CSS_SELECTOR, '.ant-btn')

        user_name.send_keys('HNI_MANAGER')
        passwd.send_keys('Xsign@HNI2021')
        login_button.click()

        user_acc_name = driver.find_element(By.CSS_SELECTOR, '.ant-dropdown-trigger > span:nth-child(2)')
        self.assertEqual(user_acc_name.text, 'hni_manager')

    def test_login_with_lower_upper_username(self):
        driver = self.driver
        user_name = driver.find_element(By.ID, 'basic_username')
        passwd = driver.find_element(By.ID, 'basic_password')
        visible_pw = driver.find_element(By.CSS_SELECTOR, '.anticon-eye-invisible > svg:nth-child(1)')
        login_button = driver.find_element(By.CSS_SELECTOR, '.ant-btn')

        user_name.send_keys('HNI_manager')
        passwd.send_keys('Xsign@HNI2021')
        login_button.click()

        user_acc_name = driver.find_element(By.CSS_SELECTOR, '.ant-dropdown-trigger > span:nth-child(2)')
        self.assertEqual(user_acc_name.text, 'hni_manager')

    def test_login_with_50_length_username(self):
        """
        nhap username la chu, so, ky tu dac biet, dau cach
        so ky tu = 50
        :return: cho phep nhap, username hien thi 50 ky tu
        """
        driver = self.driver
        user_name = driver.find_element(By.ID, 'basic_username')
        text = ''.join(random.choices(string.ascii_letters + string.digits, k=50))
        user_name.send_keys(text)
        print("User name: ", user_name.get_property('value'))

        self.assertTrue(user_name.is_enabled())
        self.assertEqual(text, user_name.get_property('value'))

    def test_login_with_more_than_50_length_username(self):
        """
        nhap username la chu, so, ky tu dac biet, dau cach
        so ky tu > 50
        :return: cho phep nhap, username hien thi 50 ky tu
        result: chua gioi han so ky tu duoc nhap o username
        """
        driver = self.driver
        user_name = driver.find_element(By.ID, 'basic_username')
        text = ''.join(random.choices(string.ascii_letters + string.digits, k=52))
        user_name.send_keys(text)
        print("User name: ", user_name.get_property('value'))

        self.assertTrue(user_name.is_enabled())
        self.assertEqual(text[:50], user_name.get_property('value'))

    def test_login_without_username(self):
        """
        username: de trong
        pw: hop le
        click login button
        :return: popup thong bao khong duoc de trong
        """
        driver = self.driver
        user_name = driver.find_element(By.ID, 'basic_username')
        passwd = driver.find_element(By.ID, 'basic_password')
        visible_pw = driver.find_element(By.CSS_SELECTOR, '.anticon-eye-invisible > svg:nth-child(1)')
        login_button = driver.find_element(By.CSS_SELECTOR, '.ant-btn')

        user_name.send_keys('')
        passwd.send_keys('123456')
        login_button.click()

        validation_username = driver.find_element(By.CSS_SELECTOR, '.ant-form-item-explain')
        self.assertTrue(validation_username.is_enabled())
        self.assertTrue(validation_username.is_displayed())

    def test_login_without_pw(self):
        """
        username: hop le
        pw: de trong
        click login button
        :return: popup thong bao khong duoc de trong
        """
        driver = self.driver
        user_name = driver.find_element(By.ID, 'basic_username')
        passwd = driver.find_element(By.ID, 'basic_password')
        visible_pw = driver.find_element(By.CSS_SELECTOR, '.anticon-eye-invisible > svg:nth-child(1)')
        login_button = driver.find_element(By.CSS_SELECTOR, '.ant-btn')

        user_name.send_keys('123456')
        passwd.send_keys('')
        login_button.click()

        validation_pw = driver.find_element(By.CSS_SELECTOR, '.ant-form-item-explain')
        self.assertTrue(validation_pw.is_enabled())
        self.assertTrue(validation_pw.is_displayed())

    def test_trimspace_username(self):
        """
        username: co dau cach o cuoi
        pw: hop le
        click login button
        :return: popup thong bao khong duoc de trong

        chua trimspace
        """
        driver = self.driver
        user_name = driver.find_element(By.ID, 'basic_username')
        passwd = driver.find_element(By.ID, 'basic_password')
        visible_pw = driver.find_element(By.CSS_SELECTOR, '.anticon-eye-invisible > svg:nth-child(1)')
        login_button = driver.find_element(By.CSS_SELECTOR, '.ant-btn')

        user_name.send_keys('hni_manager ')
        passwd.send_keys('Xsign@HNI2021')
        login_button.click()

        user_acc_name = driver.find_element(By.CSS_SELECTOR, '.ant-dropdown-trigger > span:nth-child(2)')
        self.assertEqual(user_acc_name.text, 'hni_manager')

    ## TODO: test paste username
    # def test_paste_username(self):
    #     """
    #     username: copy and paste username
    #     pw: hop le
    #     click login button
    #     :return: dang nhap thanh cong
    #     """
    #     driver = self.driver
    #     user_name = driver.find_element(By.ID, 'basic_username')
    #     passwd = driver.find_element(By.ID, 'basic_password')
    #     visible_pw = driver.find_element(By.CSS_SELECTOR, '.anticon-eye-invisible > svg:nth-child(1)')
    #     login_button = driver.find_element(By.CSS_SELECTOR, '.ant-btn')
    #
    #     pyperclip.copy('hni_manager')
    #     user_name.send_keys(Keys.CONTROL, 'v')
    #     passwd.send_keys('Xsign@HNI2021')
    #     login_button.click()
    #

    def test_login_copy_paste(self):
        """
        username: copy and paste username
        pw: hop le
        click login button
        :return: dang nhap thanh cong
        """
        driver = self.driver
        user_name = driver.find_element(By.ID, 'basic_username')
        passwd = driver.find_element(By.ID, 'basic_password')
        visible_pw = driver.find_element(By.CSS_SELECTOR, '.anticon-eye-invisible > svg:nth-child(1)')
        login_button = driver.find_element(By.CSS_SELECTOR, '.ant-btn')

        user_name.send_keys('hni_manager')
        user_name.send_keys(Keys.CONTROL, 'a')
        user_name.send_keys(Keys.CONTROL, 'c')
        passwd.send_keys(Keys.CONTROL, 'v')
        visible_pw.click()
        time.sleep(3)
        self.assertEqual(passwd.get_property('value'), 'hni_manager')

    def test_check_static_username(self):
        """
        username: hop le
        pw: mac dinh
        :return:
        """
        driver = self.driver
        user_name = driver.find_element(By.ID, 'basic_username')
        self.assertEqual(user_name.get_property('placeholder'), 'Tài khoản')

    def test_check_static_passwd(self):
        """
        username: hop le
        pw: mac dinh
        :return:
        """
        driver = self.driver
        passwd = driver.find_element(By.ID, 'basic_password')
        self.assertEqual(passwd.get_property('placeholder'), 'Mật khẩu')

    def test_check_pwd_is_encoded(self):
        ## TODO: check pwd is encoded
        driver = self.driver
        passwd = driver.find_element(By.ID, 'basic_password')
        passwd.send_keys("12345")
        print(passwd.get_property('value'))

    def test_login_with_invalid_pwd(self):
        """
        username: hop le
        pwd: ko hop le
        click login button
        :return: alert "Vui long kiem tra thong tin dang nhap"
        """
        driver = self.driver
        user_name = driver.find_element(By.ID, 'basic_username')
        passwd = driver.find_element(By.ID, 'basic_password')
        visible_pw = driver.find_element(By.CSS_SELECTOR, '.anticon-eye-invisible > svg:nth-child(1)')
        login_button = driver.find_element(By.CSS_SELECTOR, '.ant-btn')

        user_name.send_keys('hni_manager')
        passwd.send_keys('1234')
        login_button.click()

        alert_mess = driver.find_element(By.CSS_SELECTOR, '.ant-alert')
        self.assertEqual(alert_mess.text, "Vui lòng kiểm tra lại thông tin đăng nhập.")

    def test_check_lower_upper_pwd(self):
        driver = self.driver
        user_name = driver.find_element(By.ID, 'basic_username')
        passwd = driver.find_element(By.ID, 'basic_password')
        visible_pw = driver.find_element(By.CSS_SELECTOR, '.anticon-eye-invisible > svg:nth-child(1)')
        login_button = driver.find_element(By.CSS_SELECTOR, '.ant-btn')

        user_name.send_keys('hni_manager')
        passwd.send_keys('xsign@hni2021')
        login_button.click()

        alert_mess = driver.find_element(By.CSS_SELECTOR, '.ant-alert')
        self.assertEqual(alert_mess.text, "Vui lòng kiểm tra lại thông tin đăng nhập.")

    def test_login_with_16_length_pwd(self):
        driver = self.driver
        passwd = driver.find_element(By.ID, 'basic_password')

        text = ''.join(random.choices(string.ascii_letters + string.digits, k=16))
        passwd.send_keys(text)
        print(text)
        print("pwd: ", passwd.get_property('value'))

        self.assertTrue(passwd.is_enabled())
        self.assertEqual(text, passwd.get_property('value'))

    def test_login_with_more_than_16_length_pwd(self):
        driver = self.driver
        passwd = driver.find_element(By.ID, 'basic_password')

        text = ''.join(random.choices(string.ascii_letters + string.digits, k=17))
        passwd.send_keys(text)
        print(text[:16])
        print("pwd: ", passwd.get_property('value'))

        self.assertTrue(passwd.is_enabled())
        self.assertEqual(text[:16], passwd.get_property('value'))

    def test_login_with_less_than_7_length_pwd(self):
        driver = self.driver
        passwd = driver.find_element(By.ID, 'basic_password')

        text = ''.join(random.choices(string.ascii_letters + string.digits, k=6))
        passwd.send_keys(text)
        print("pwd: ", passwd.get_property('value'))

        self.assertTrue(passwd.is_enabled())
        self.assertEqual(text, passwd.get_property('value'))

    def test_copy_paste_pwd(self):
        """
        username:
        pw: copy and paste pwd
        :return: khong cho phep copy paste pwd
        """
        driver = self.driver
        passwd = driver.find_element(By.ID, 'basic_password')
        user_name = driver.find_element(By.ID, 'basic_username')

        passwd.send_keys('hni_manager')
        passwd.send_keys(Keys.CONTROL, 'a')
        passwd.send_keys(Keys.CONTROL, 'c')
        user_name.clear()
        user_name.send_keys(Keys.CONTROL, 'v')
        time.sleep(3)

        self.assertNotEqual(user_name.get_property('value'), 'hni_manager')

    ## TODO: test paste pwd
    ## TODO: checker autosave account

    def tearDown(self):
        self.driver.close()


if __name__ == "__main__":
    unittest.main()
