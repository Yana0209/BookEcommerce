package com.example.ecommerce.service;

import com.example.ecommerce.model.User;
import com.example.ecommerce.repository.UserRepository;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.security.crypto.password.PasswordEncoder;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class UserServiceTest {

    @Mock
    private UserRepository userRepository;

    @Mock
    private PasswordEncoder passwordEncoder;

    @InjectMocks
    private UserService userService;

    public UserServiceTest() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testCreateUser_Success() {

        User user = new User();
        user.setEmail("test@example.com");
        user.setPassword("password123");

        when(userRepository.findByEmail(anyString())).thenReturn(null);
        when(passwordEncoder.encode(any())).thenReturn("encodedPassword");


        boolean result = userService.createUser(user);


        assertTrue(result);
        assertEquals("encodedPassword", user.getPassword());
        verify(userRepository, times(1)).save(user);
    }

    @Test
    void testCreateUser_Failure() {

        User user = new User();
        user.setEmail("existing@example.com");
        user.setPassword("password123");

        when(userRepository.findByEmail(anyString())).thenReturn(new User());

        boolean result = userService.createUser(user);

        assertFalse(result);
        verify(userRepository, never()).save(any());
    }
}
