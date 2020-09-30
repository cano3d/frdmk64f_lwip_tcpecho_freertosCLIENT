/*
 * Copyright (c) 2001-2003 Swedish Institute of Computer Science.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
 * SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
 * OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
 * IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY
 * OF SUCH DAMAGE.
 *
 * This file is part of the lwIP TCP/IP stack.
 *
 * Author: Adam Dunkels <adam@sics.se>
 *
 */
#include "tcpecho.h"

#include "lwip/opt.h"

#if LWIP_NETCONN


#define serverIP_ADDR0 192
#define serverIP_ADDR1 168
#define serverIP_ADDR2 1
#define serverIP_ADDR3 67

#include "lwip/sys.h"
#include "lwip/api.h"
/*-----------------------------------------------------------------------------------*/
static void
tcpecho_thread(void *arg)
{
  struct netconn *conn, *newconn;

  #define getipaddr_ADDR0 0U
  #define getipaddr_ADDR1 0U
  #define getipaddr_ADDR2 0U
  #define getipaddr_ADDR3 0U

  ip4_addr_t getipaddr;
  IP4_ADDR (&getipaddr, getipaddr_ADDR0, getipaddr_ADDR1, getipaddr_ADDR2, getipaddr_ADDR3);

  err_t err;
  LWIP_UNUSED_ARG(arg);

  //ip4_addr_t serveraddr

  ip4_addr_t serverip;
  IP4_ADDR (&serverip, serverIP_ADDR0, serverIP_ADDR1, serverIP_ADDR2, serverIP_ADDR3);


  /* Create a new connection identifier. */
  /* Bind connection to well known port number 7. */
#if LWIP_IPV6
  conn = netconn_new(NETCONN_TCP_IPV6);
  netconn_bind(conn, IP6_ADDR_ANY, 7);
#else /* LWIP_IPV6 */
  conn = netconn_new(NETCONN_TCP);
  //netconn_bind(conn, local_ip, 8);
#endif /* LWIP_IPV6 */
  LWIP_ERROR("tcpecho: invalid conn", (conn != NULL), return;);

  /* Tell connection to go into listening mode. */
  //netconn_listen(conn);

  err = netconn_gethostbyname("iteso.mx", &getipaddr);

  if (err == 0){
  PRINTF("La direccion de iteso.mx es %s\n",ipaddr_ntoa(&getipaddr));
  }else{
	  printf("No se pudo resolver el dominio");
  }

  while (1) {

    /* Grab new connection. */
    err = netconn_connect(conn, &serverip, 7);
    printf("accepted new connection %p\n", newconn);


    /* Process the new connection. */
    if (err == ERR_OK) {
      struct netbuf *buf;
      void *data;
      const char mydata[]={"Este es el dato que vamos a mandar :)"};
      u16_t len=strlen(mydata);
      printf("String to send %s\n", mydata);

#if 0
      while ((err = netconn_recv(newconn, &buf)) == ERR_OK) {
        printf("Recved %d\n", data);
        do {
             netbuf_data(buf, &data, &len);
             err = netconn_write(newconn, data, len, NETCONN_COPY);
             printf("Data is: %s",data);
#if 0
            if (err != ERR_OK) {
              printf("tcpecho: netconn_write: error \"%s\"\n", lwip_strerr(err));
            }
#endif
        } while (netbuf_next(buf) >= 0);
        netbuf_delete(buf);
      }
#endif

      while ((err = netconn_write(conn, mydata, len, NETCONN_COPY)) == ERR_OK){
    	  //err = netconn_recv(newconn, &buf)
        printf("Tx data: %s \n", mydata);

        vTaskDelay(20000);// Delay every 20s
        do {
        	 err = netconn_recv(conn, &buf);
             netbuf_data(buf, &data, &len);
             printf("Rx data: %s \n",data); // I dont understand why I seem to be getting some trash in the buffer, could it be the length of the string?
#if 0
            if (err != ERR_OK) {
              printf("tcpecho: netconn_write: error \"%s\"\n", lwip_strerr(err));
            }
#endif
        } while
            (netbuf_next(buf) >= 0);
            netbuf_delete(buf);
      }



      /*printf("Got EOF, looping\n");*/
      /* Close connection and discard connection identifier. */
      netconn_close(conn);
      printf("Close connection\n");
      netconn_delete(conn);
      printf("Delete connection\n");

    }
  }
}
/*-----------------------------------------------------------------------------------*/
void
tcpecho_init(void)
{
  sys_thread_new("tcpecho_thread", tcpecho_thread, NULL, DEFAULT_THREAD_STACKSIZE, DEFAULT_THREAD_PRIO);
}
/*-----------------------------------------------------------------------------------*/

#endif /* LWIP_NETCONN */
