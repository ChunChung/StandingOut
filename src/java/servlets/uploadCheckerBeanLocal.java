/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import javax.ejb.Local;

/**
 *
 * @author chunchung
 */
@Local
public interface uploadCheckerBeanLocal {
        String checkUpload(String url, String score, String description);
}