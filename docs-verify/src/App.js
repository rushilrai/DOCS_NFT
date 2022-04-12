import {
  Button,
  FormControl,
  Flex,
  Heading,
  Input,
  Stack,
  InputGroup,
  InputRightAddon,
  useColorModeValue,
  useToast
} from '@chakra-ui/react';
import { AttachmentIcon } from '@chakra-ui/icons';
import { useState, useRef } from 'react';
import { sha256 } from 'crypto-hash';
import axios from "axios";

function App() {
  const inputRef = useRef(null);
  const toast = useToast();
  const [fileName, setFileName] = useState('');
  const [fileHash, setFileHash] = useState('');
  const [verifying, setVerifying] = useState(false);

  async function generateHash(buffer) {
    let hash = await sha256(buffer);
    setFileHash(hash);
    console.log(hash);
  }

  async function verifyPrescription() {
    if (fileName === '') {
      toast({
        title: 'Select a File',
        description: "Please Upload a Prescription to Continue",
        status: 'warning',
      })
    } else {
      if (fileHash === '') {
        toast({
          title: 'Please Wait',
          description: "Hashing in Progress..",
          status: 'warning',
        })
      }
      else {
        setVerifying(true);
        try {
          console.log({
            "fileHash": fileHash
          });
          const response = await axios.post('http://localhost:8080/prescription/lookup', {
            "fileHash": fileHash
          });
          let data = response.data;
          console.log(data);
          if (response.status === 200) {
            toast({
              title: 'Valid',
              description: 'The Prescription is valid & has not been tampered',
              status: 'success',
            })
          }
        } catch (error) {
          toast({
            title: 'Error',
            description: 'The Prescription is invalid or has been tampered with',
            status: 'error',
          })
        }
        setVerifying(false);
      }
    }
  }

  return (
    <Flex
      minH={'100vh'}
      align={'center'}
      justify={'center'}
      bg={useColorModeValue('gray.50', 'gray.800')}>
      <Stack
        spacing={4}
        w={'full'}
        maxW={'md'}
        bg={useColorModeValue('white', 'gray.700')}
        rounded={'xl'}
        boxShadow={'lg'}
        p={6}
        my={12}>
        <Heading lineHeight={1.1} fontSize={{ base: 'xl', md: '2xl' }}>
          Upload Prescription to Verify
        </Heading>
        <FormControl id="file">
          <InputGroup>
            <Input
              type="text"
              isReadOnly={true}
              value={fileName} />
            <InputRightAddon>
              <Button onClick={() => inputRef.current.click()}>
                <AttachmentIcon />
              </Button>
              <input
                type="file"
                onChange={async () => {
                  setFileName(inputRef.current.files[0].name);
                  let reader = new FileReader();

                  reader.onload = function (e) {
                    let arrayBuffer = new Uint8Array(reader.result);
                    generateHash(reader.result)
                  }

                  reader.readAsArrayBuffer(inputRef.current.files[0]);

                }}
                ref={inputRef}
                style={{ display: "none" }}
              />
            </InputRightAddon>
          </InputGroup>
        </FormControl>
        <Stack spacing={6}>
          <Button
            bg={'blue.400'}
            color={'white'}
            isLoading={verifying}
            onClick={() => { verifyPrescription() }}
            _hover={{
              bg: 'blue.500',
            }}>
            Verify
          </Button>
        </Stack>
      </Stack>
    </Flex>
  );
}

export default App;

