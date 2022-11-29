USE Exa_2
DELIMITER $$
CREATE DEFINER=`root`@`localhost` 
PROCEDURE `spRegisterUser`(IN PUsername varchar(150),IN pEmail varchar(100),IN pPass blob, out pMessage VARCHAR(200))

BEGIN
IF(SELECT REGEXP_LIKE(Pass, '^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$#%&/.,?])[A-Za-z[0-9]$#%&/.,?]{8,}$')!=1) THEN
    SET pMessage:= 'EL EMAIL esta duplicado 
					La contraseña debe detener al menos una mayuscula, al menos un numero y
                    al menos un caracter especial ($#%&/.,?)';
ELSE 
	INSERT INTO tblUser (Username,Email,Pass) 
    values (PUsername,pEmail, AES_ENCRYPT(pPass,'key')); SET pMessage:= 'Usuario ingresado';
    end if;
end$$


CALL spRegisterUser("rodri", "rodri840@gmail.com",'dardre840?',@pMessage);
CALL spRegisterUser("alonso", "alonso840@gmail.com",'dierdre840#',@pMessage);
SELECT @pMessage
SELECT * FROM tblUser