/**
 * Copyright (C) 2005-2009 Alfresco Software Limited.
 *
 * This file is part of the Spring Surf Extension project.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.springframework.extensions.webscripts;

import org.springframework.extensions.webscripts.Description.RequiredAuthentication;

/**
 * Web Script Authenticator for the HTTP Servlet environment
 * 
 * @author davidc
 */
public interface Authenticator
{
   /**
    * Authenticate Web Script execution
    * 
    * @param required  required level of authentication
    * @param isGuest  is Guest accessing the web script
    * 
    * @return true if authorised to execute the script, false otherwise
    */
   public boolean authenticate(RequiredAuthentication required, boolean isGuest);
   
   /**
    * Are credentials set in the request ?
    * 
    * @return true if credentials are empty
    * @since 3.2
    */
   public boolean emptyCredentials();
}
