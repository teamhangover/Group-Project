/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.DoggyWalker.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author glamb
 */
@Service
public class FileHandlingServiceImpl implements FileHandlingService{
    
    @Value("${images.upload.dir}")
    public String uploaddir;

    @Override
    public String storeFileToDisk(MultipartFile file, String fileName) {
        //alternative > file.transferTo(destisnationPath);
        String extension = StringUtils.getFilenameExtension(file.getOriginalFilename());
        String imageName = StringUtils.cleanPath(fileName + "." + extension);
        //StringUtils einai class t Spring
        Path copyLocation = Paths
                .get(uploaddir + File.separator + imageName);
        //File.seperator tha ferei to antistoixo slash "/" h "\" h oti allo einai, analoga me to Operating System 
        try {

            Files.copy(file.getInputStream(),
                    copyLocation,
                    StandardCopyOption.REPLACE_EXISTING);

        } catch (IOException ex) {
            Logger.getLogger(FileHandlingServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return imageName;
    }
    
}
