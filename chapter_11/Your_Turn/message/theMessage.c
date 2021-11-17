/* theMessage.c
 * Provides message, returns number of characters in message.
 */

int theMessage(char *aMessage)
{

  int nChars = 0;
  char *messagePtr = "Hello.\n";

  while (*messagePtr != 0)
  {
    *aMessage = *messagePtr;
    nChars++;
    messagePtr++;
    aMessage++;
  }

  return nChars;
}
