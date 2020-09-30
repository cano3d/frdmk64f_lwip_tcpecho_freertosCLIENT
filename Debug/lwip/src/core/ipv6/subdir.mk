################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lwip/src/core/ipv6/dhcp6.c \
../lwip/src/core/ipv6/ethip6.c \
../lwip/src/core/ipv6/icmp6.c \
../lwip/src/core/ipv6/inet6.c \
../lwip/src/core/ipv6/ip6.c \
../lwip/src/core/ipv6/ip6_addr.c \
../lwip/src/core/ipv6/ip6_frag.c \
../lwip/src/core/ipv6/mld6.c \
../lwip/src/core/ipv6/nd6.c 

OBJS += \
./lwip/src/core/ipv6/dhcp6.o \
./lwip/src/core/ipv6/ethip6.o \
./lwip/src/core/ipv6/icmp6.o \
./lwip/src/core/ipv6/inet6.o \
./lwip/src/core/ipv6/ip6.o \
./lwip/src/core/ipv6/ip6_addr.o \
./lwip/src/core/ipv6/ip6_frag.o \
./lwip/src/core/ipv6/mld6.o \
./lwip/src/core/ipv6/nd6.o 

C_DEPS += \
./lwip/src/core/ipv6/dhcp6.d \
./lwip/src/core/ipv6/ethip6.d \
./lwip/src/core/ipv6/icmp6.d \
./lwip/src/core/ipv6/inet6.d \
./lwip/src/core/ipv6/ip6.d \
./lwip/src/core/ipv6/ip6_addr.d \
./lwip/src/core/ipv6/ip6_frag.d \
./lwip/src/core/ipv6/mld6.d \
./lwip/src/core/ipv6/nd6.d 


# Each subdirectory must supply rules for building sources it contributes
lwip/src/core/ipv6/%.o: ../lwip/src/core/ipv6/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__REDLIB__ -DCPU_MK64FN1M0VLL12 -DCPU_MK64FN1M0VLL12_cm4 -DUSE_RTOS=1 -DPRINTF_ADVANCED_ENABLE=1 -DFRDM_K64F -DFREEDOM -DSERIAL_PORT_TYPE_UART=1 -DFSL_RTOS_FREE_RTOS -DSDK_DEBUGCONSOLE=0 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"F:\MCUXpressoworkspace\workspace\frdmk64f_lwip_tcpecho_freertosCLIENT\board" -I"F:\MCUXpressoworkspace\workspace\frdmk64f_lwip_tcpecho_freertosCLIENT\source" -I"F:\MCUXpressoworkspace\workspace\frdmk64f_lwip_tcpecho_freertosCLIENT" -I"F:\MCUXpressoworkspace\workspace\frdmk64f_lwip_tcpecho_freertosCLIENT\mdio" -I"F:\MCUXpressoworkspace\workspace\frdmk64f_lwip_tcpecho_freertosCLIENT\drivers" -I"F:\MCUXpressoworkspace\workspace\frdmk64f_lwip_tcpecho_freertosCLIENT\device" -I"F:\MCUXpressoworkspace\workspace\frdmk64f_lwip_tcpecho_freertosCLIENT\CMSIS" -I"F:\MCUXpressoworkspace\workspace\frdmk64f_lwip_tcpecho_freertosCLIENT\phy" -I"F:\MCUXpressoworkspace\workspace\frdmk64f_lwip_tcpecho_freertosCLIENT\lwip\contrib\apps\tcpecho" -I"F:\MCUXpressoworkspace\workspace\frdmk64f_lwip_tcpecho_freertosCLIENT\lwip\port\arch" -I"F:\MCUXpressoworkspace\workspace\frdmk64f_lwip_tcpecho_freertosCLIENT\lwip\src\include\compat\posix\arpa" -I"F:\MCUXpressoworkspace\workspace\frdmk64f_lwip_tcpecho_freertosCLIENT\lwip\src\include\compat\posix\net" -I"F:\MCUXpressoworkspace\workspace\frdmk64f_lwip_tcpecho_freertosCLIENT\lwip\src\include\compat\posix" -I"F:\MCUXpressoworkspace\workspace\frdmk64f_lwip_tcpecho_freertosCLIENT\lwip\src\include\compat\posix\sys" -I"F:\MCUXpressoworkspace\workspace\frdmk64f_lwip_tcpecho_freertosCLIENT\lwip\src\include\compat\stdc" -I"F:\MCUXpressoworkspace\workspace\frdmk64f_lwip_tcpecho_freertosCLIENT\lwip\src\include\lwip" -I"F:\MCUXpressoworkspace\workspace\frdmk64f_lwip_tcpecho_freertosCLIENT\lwip\src\include\lwip\priv" -I"F:\MCUXpressoworkspace\workspace\frdmk64f_lwip_tcpecho_freertosCLIENT\lwip\src\include\lwip\prot" -I"F:\MCUXpressoworkspace\workspace\frdmk64f_lwip_tcpecho_freertosCLIENT\lwip\src\include\netif" -I"F:\MCUXpressoworkspace\workspace\frdmk64f_lwip_tcpecho_freertosCLIENT\lwip\src\include\netif\ppp" -I"F:\MCUXpressoworkspace\workspace\frdmk64f_lwip_tcpecho_freertosCLIENT\lwip\src\include\netif\ppp\polarssl" -I"F:\MCUXpressoworkspace\workspace\frdmk64f_lwip_tcpecho_freertosCLIENT\utilities" -I"F:\MCUXpressoworkspace\workspace\frdmk64f_lwip_tcpecho_freertosCLIENT\component\serial_manager" -I"F:\MCUXpressoworkspace\workspace\frdmk64f_lwip_tcpecho_freertosCLIENT\component\lists" -I"F:\MCUXpressoworkspace\workspace\frdmk64f_lwip_tcpecho_freertosCLIENT\lwip\port" -I"F:\MCUXpressoworkspace\workspace\frdmk64f_lwip_tcpecho_freertosCLIENT\freertos\freertos_kernel\include" -I"F:\MCUXpressoworkspace\workspace\frdmk64f_lwip_tcpecho_freertosCLIENT\freertos\freertos_kernel\portable\GCC\ARM_CM4F" -I"F:\MCUXpressoworkspace\workspace\frdmk64f_lwip_tcpecho_freertosCLIENT\component\uart" -I"F:\MCUXpressoworkspace\workspace\frdmk64f_lwip_tcpecho_freertosCLIENT\lwip\src" -I"F:\MCUXpressoworkspace\workspace\frdmk64f_lwip_tcpecho_freertosCLIENT\lwip\src\include" -O0 -fno-common -g3 -Wall -c  -ffunction-sections  -fdata-sections  -ffreestanding  -fno-builtin -fmerge-constants -fmacro-prefix-map="../$(@D)/"=. -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


