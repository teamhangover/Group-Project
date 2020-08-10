/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.DoggyWalker.service;

import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author glamb
 */
public interface FileHandlingService {

    public String storeFileToDisk(MultipartFile file, String fileName);
}
